weather_data = File.read('./w_data.dat').lines.map {|line| line.split}[6..-4]

unsplitted_data = File.read('./soccer.dat').lines.map {|line| line.split}[3..-2]
soccer_data = unsplitted_data[0..-5] + unsplitted_data[-3..-1]

def calculate_min_diff(title_idx, max_idx, low_idx, data_arr)
    min_spread = Float::INFINITY;
    min_spread_title = nil
    data_arr.each do |row|
        title = row[title_idx]
        max_temp = row[max_idx].to_f
        min_temp = row[low_idx].to_f
        diff = (max_temp - min_temp).abs
        if diff < min_spread
            min_spread = diff
            min_spread_title = title
        end
    end
    min_spread_title
end



day = calculate_min_diff(0, 1, 2, weather_data)
team_name = calculate_min_diff(1, 6, 8, soccer_data)

print "Day with minimum temperature spread: #{day}"
print "\n"
print "Team with the smallest difference in ‘for’ and ‘against’ goals: #{team_name}"
print "\n"