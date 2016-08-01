//
//  ViewController.m
//  LineSpaceForTextView
//
//  Created by 刘浩浩 on 16/8/1.
//  Copyright © 2016年 CodingFire. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITextViewDelegate>
{
    UITextView *_textView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.automaticallyAdjustsScrollViewInsets = NO;

    
    _textView = [[UITextView alloc]initWithFrame:CGRectMake(10, 100, 300, 80)];
    _textView.delegate = self;
    _textView.text = @"请在这里输入内容";
    _textView.layer.cornerRadius = 10;
    _textView.layer.borderWidth = 1;
    _textView.layer.borderColor = [UIColor blackColor].CGColor;
    [self.view addSubview:_textView];
    
    //又内容时该设置才生效，需要切记
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    paragraphStyle.lineSpacing = 8;
    NSDictionary *attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:15],NSParagraphStyleAttributeName:paragraphStyle,NSForegroundColorAttributeName:[UIColor grayColor]};
    _textView.attributedText = [[NSAttributedString alloc]initWithString:_textView.text attributes:attributes];

    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //收起键盘
    [_textView resignFirstResponder];
    
}

#pragma mark - UITextViewDelegate

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    //编辑时删除代替placeholder效果的内容
    if ([_textView.text isEqualToString:@"请在这里输入内容"]) {
        textView.text = @"";
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
        paragraphStyle.lineSpacing = 8;
        NSDictionary *attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:15],NSParagraphStyleAttributeName:paragraphStyle,NSForegroundColorAttributeName:[UIColor blackColor]};
        _textView.attributedText = [[NSAttributedString alloc]initWithString:_textView.text attributes:attributes];
    }

    return YES;
}

- (void)textViewDidChange:(UITextView *)textView
{
    //编辑时把placeholder效果颜色变为正常效果
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    paragraphStyle.lineSpacing = 8;
    NSDictionary *attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:15],NSParagraphStyleAttributeName:paragraphStyle,NSForegroundColorAttributeName:[UIColor blackColor]};
    _textView.attributedText = [[NSAttributedString alloc]initWithString:_textView.text attributes:attributes];
   
}
- (void)textViewDidEndEditing:(UITextView *)textView
{
    //若编辑结束，内容为空，变最开始placeholder效果
    if ([textView.text isEqualToString:@""]) {
        _textView.text = @"请在这里输入内容";
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
        paragraphStyle.lineSpacing = 8;
        NSDictionary *attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:15],NSParagraphStyleAttributeName:paragraphStyle,NSForegroundColorAttributeName:[UIColor grayColor]};
        _textView.attributedText = [[NSAttributedString alloc]initWithString:_textView.text attributes:attributes];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
