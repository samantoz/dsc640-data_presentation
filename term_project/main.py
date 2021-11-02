from bokeh.plotting import figure, output_file, show

x = [1,2,3,4,5]
y = [4,3,6,7,5]

output_file('index.html')

# Add plot
p = figure(
	title='Simple Example',
	x_axis_label='X Axis',
	y_axis_label='Y Axis'
)

# Render glyph

p.line(x,y, legend_label='Test',line_width=2)

# Show results
show(p)
