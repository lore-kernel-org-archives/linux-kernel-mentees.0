Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1932AC43334
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 Jul 2022 04:22:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7FB8360E85;
	Mon, 11 Jul 2022 04:22:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7FB8360E85
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=iqarByK8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 06Gati7kks1U; Mon, 11 Jul 2022 04:22:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 7F71960DF0;
	Mon, 11 Jul 2022 04:22:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F71960DF0
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 57683C0033;
	Mon, 11 Jul 2022 04:22:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BA282C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 Jul 2022 04:22:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9488460DF0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 Jul 2022 04:22:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9488460DF0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pupPG_u_lNsy
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 Jul 2022 04:22:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E92D460AFE
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E92D460AFE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 Jul 2022 04:22:42 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id c13so3448647pla.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 10 Jul 2022 21:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=dy7+GGN73umpQ2Bj6ZKtVNghFJ8bz6lPPPijWYG4Dy0=;
 b=iqarByK8IT+N2BbRHDK6Rtx6x6WVei2xs98PxQ+dt/A8dXl91s0EamQ5q1Jjg9TsL/
 yy+c7ADACWYCbh/WmABlv1vyE4towXZ4h9Cz13GEvu/mp16IJU8Niqqpo9DvUKLbkwVc
 u6ELg7Ft3k3kB0lebbvYLwwfc2tHfjQufadRsLLa9IywNg+t7rnkgiLbLBArlR9kJc0K
 hbC+T85cz6REwN1lA+czh0IdHWHgNXVN6nLNmpLl5ErXC8QA7h5QzSpIRwfyvlJtt6uN
 5f3ygL4FrIkUHXyPq7ODAS/efk0ehpwO04th8I0nOyBwY/bOJn1OZFL54PN8o4laDoqU
 hajA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dy7+GGN73umpQ2Bj6ZKtVNghFJ8bz6lPPPijWYG4Dy0=;
 b=rHwVTnGeiQ9dyGQpdSYzwJTrF0foibO28R5M4xRde5BeE9Da0J9U/v63ql2foy1RV1
 DuA6whjoWB+M4x2YR5WGEmp7o5Eh9tanf1Yzps9HEdGmK5vScN3mRhbswInDWcvVAc+c
 4hYMwl/3RRnz8Wge2SIvQ3kjQA+h7kG2erGgLqC0vrd2aLxcIfpvVNxqclfvFqM++Yz4
 mLoyUe3t4cctm8tEBtC18T8/N9U3VFu0BakPp9bHM1ALRZyC3a+tQWRFI+O2nvY6X/qL
 wWC1wPjJREfO0BZyN4aYrtMuX+bdJaQ2Ktjet7yrCmy0Zo6zKiCowR0HkhwhK3i/fKHM
 EzhQ==
X-Gm-Message-State: AJIora9WVoIRkFm0yXCqVjGEzNpKVa+0kbLRaqnZcWJtaBu1FcPZV98V
 CVc3h2OLFUSXSNEDww2E6ZfjB6AU/+5utg==
X-Google-Smtp-Source: AGRyM1uiZMUMMhRPI8kqqb30ejrMbEQUWkDHOx9Vj+HTvTOSd+7yf1HmDg+K9oQ/6MfPZ9xHR/Yhqg==
X-Received: by 2002:a17:902:7290:b0:16b:b6b5:7e6c with SMTP id
 d16-20020a170902729000b0016bb6b57e6cmr17081706pll.116.1657513362248; 
 Sun, 10 Jul 2022 21:22:42 -0700 (PDT)
Received: from fedora ([103.230.148.186]) by smtp.gmail.com with ESMTPSA id
 y8-20020a17090a154800b001eee8998f2esm5877357pja.17.2022.07.10.21.22.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Jul 2022 21:22:41 -0700 (PDT)
Date: Mon, 11 Jul 2022 09:52:36 +0530
From: Gautam Menghani <gautammenghani201@gmail.com>
To: shuah@kernel.org
Subject: Re: [PATCH] selftests/kcmp: Make the test output consistent and clear
Message-ID: <YsuljDee9KGDPfsH@fedora>
References: <20220629192822.47577-1-gautammenghani201@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220629192822.47577-1-gautammenghani201@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Hi Shuah,
Please review this patch and let me know if any changes are required.
On Thu, Jun 30, 2022 at 12:58:22AM +0530, Gautam Menghani wrote:
> Make the output format of this test consistent. Currently the output is
> as follows:
> 
> +TAP version 13
> +1..1
> +# selftests: kcmp: kcmp_test
> +# pid1:  45814 pid2:  45815 FD:  1 FILES:  1 VM:  2 FS:  1 SIGHAND:  2 
> +  IO:  0 SYSVSEM:  0 INV: -1
> +# PASS: 0 returned as expected
> +# PASS: 0 returned as expected
> +# PASS: 0 returned as expected
> +# # Planned tests != run tests (0 != 3)
> +# # Totals: pass:3 fail:0 xfail:0 xpass:0 skip:0 error:0
> +# # Planned tests != run tests (0 != 3)
> +# # Totals: pass:3 fail:0 xfail:0 xpass:0 skip:0 error:0
> +# # Totals: pass:0 fail:0 xfail:0 xpass:0 skip:0 error:0
> +ok 1 selftests: kcmp: kcmp_test
> 
> With this patch applied the output is as follows:
> 
> +TAP version 13
> +1..1
> +# selftests: kcmp: kcmp_test
> +# TAP version 13
> +# 1..3
> +# pid1:  46330 pid2:  46331 FD:  1 FILES:  2 VM:  2 FS:  2 SIGHAND:  1 
> +  IO:  0 SYSVSEM:  0 INV: -1
> +# PASS: 0 returned as expected
> +# PASS: 0 returned as expected
> +# PASS: 0 returned as expected
> +# # Totals: pass:3 fail:0 xfail:0 xpass:0 skip:0 error:0
> +ok 1 selftests: kcmp: kcmp_test
> 
> 
> Signed-off-by: Gautam Menghani <gautammenghani201@gmail.com>
> ---
>  tools/testing/selftests/kcmp/kcmp_test.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/testing/selftests/kcmp/kcmp_test.c b/tools/testing/selftests/kcmp/kcmp_test.c
> index 6ea7b9f37a41..25110c7c0b3e 100644
> --- a/tools/testing/selftests/kcmp/kcmp_test.c
> +++ b/tools/testing/selftests/kcmp/kcmp_test.c
> @@ -88,6 +88,9 @@ int main(int argc, char **argv)
>  		int pid2 = getpid();
>  		int ret;
>  
> +		ksft_print_header();
> +		ksft_set_plan(3);
> +
>  		fd2 = open(kpath, O_RDWR, 0644);
>  		if (fd2 < 0) {
>  			perror("Can't open file");
> @@ -152,7 +155,6 @@ int main(int argc, char **argv)
>  			ksft_inc_pass_cnt();
>  		}
>  
> -		ksft_print_cnts();
>  
>  		if (ret)
>  			ksft_exit_fail();
> @@ -162,5 +164,5 @@ int main(int argc, char **argv)
>  
>  	waitpid(pid2, &status, P_ALL);
>  
> -	return ksft_exit_pass();
> +	return 0;
>  }
> -- 
> 2.36.1
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
