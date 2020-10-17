Return-Path: <SRS0=PE7C=DY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 239A1C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 17 Oct 2020 05:39:12 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF12C20714
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 17 Oct 2020 05:39:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WZO0P/Q3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF12C20714
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6897188E36;
	Sat, 17 Oct 2020 05:39:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2lNV91jcupkN; Sat, 17 Oct 2020 05:39:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id E646A88E26;
	Sat, 17 Oct 2020 05:39:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C2B9FC07FF;
	Sat, 17 Oct 2020 05:39:09 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8559BC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Oct 2020 05:39:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 8F6EB84409
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Oct 2020 05:39:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VPWpBOSzwK5o
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Oct 2020 05:39:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 6A53888A0D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Oct 2020 05:39:06 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id p21so2485059pju.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 16 Oct 2020 22:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:subject:to:references:cc:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4/7LLtqOhhDltbT5iyVIoQlxz04Qw1iK5D+InGfjR3g=;
 b=WZO0P/Q3G/Y1CQWQR/R0RJ9ncCTclF/DCUaL2edPlVm+PqVrBR2qQ63kh6y7Ao5XUI
 S4fbSVnWHUouFbFFXBTDAchVBEw5AY7NsE03VHfHCYr09ITFtTquze6Qe2HdniYE05Bg
 K7e/AXKE/MWnE+LnjVWpxFx/Y5QQFHXX6ytKVjlFbKd1+l9HfaEEvq2cjgmD8VU2UFKD
 DwcL3rEyDIZACUCPOLL1jf+3tOQPDJg+hVYChvUGscwCiFO2MWH/+bK54oVl96ZXta7F
 uQSJv2XR0tPv/NBSVXe9SFzEu3BreXaEpJXN1cW/K/unR3K95WiBb/47Lw8FH3ESHir+
 ajWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:references:cc:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4/7LLtqOhhDltbT5iyVIoQlxz04Qw1iK5D+InGfjR3g=;
 b=kBqRkY3hM8OaKL8SUdK3WczEOXvXsW3mF+ZMa/haiy26lhhyt0Q3heqGWv57r3dGvc
 fUK31qLQTYu4AT52XAL5s3SKbf7+3QsLzwP5FgDTV1HrtjN1chXVXEvYzWrspqeTH1l5
 w/o9H+CNfUs0cYdxyVXP63GkZqA9BehAAkjKH28ufbfe9t2H9lXPsORp7CRlM1Gqws8X
 Son3MGV0z8l1Bb37Vrnkf1dPkw5KsKDKZc2eOqUuV0UZ+Taa8sHt7gcmpzO5O2uTuydi
 08iHG16xrjbKnMGuA29B3TbA323zygTbH+B+kX0jCrg2DC4xPJXRKfV1MG27llrtjcky
 VuuA==
X-Gm-Message-State: AOAM531vJg7eXVIjFwQt4HWKIZukjHiU/5V1R95zM/BsHUlndOcHz2lT
 rgRmrpPTR5ScqgExQavwmefNST0uog74Sw==
X-Google-Smtp-Source: ABdhPJwwQgrjbiNay0jZ9JXhthFR2trQFYPM/lxZXv/TrdZuBKYCXRZOo5Lm/oHiWGk98RK71USmmw==
X-Received: by 2002:a17:90a:6283:: with SMTP id
 d3mr7434164pjj.96.1602913145587; 
 Fri, 16 Oct 2020 22:39:05 -0700 (PDT)
Received: from ?IPv6:2402:3a80:40b:2f3b:b5fc:ce0a:3815:12d4?
 ([2402:3a80:40b:2f3b:b5fc:ce0a:3815:12d4])
 by smtp.gmail.com with ESMTPSA id w17sm4377865pga.16.2020.10.16.22.39.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Oct 2020 22:39:04 -0700 (PDT)
From: Aditya <yashsri421@gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <20201013060714.33713-1-dwaipayanray1@gmail.com>
 <alpine.DEB.2.21.2010130811050.14590@felia>
 <ebc09f62-7ba3-0965-e999-0ca33156f40f@gmail.com>
Message-ID: <72615293-a433-9d19-ae9e-ec9dd2c2073c@gmail.com>
Date: Sat, 17 Oct 2020 11:08:58 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <ebc09f62-7ba3-0965-e999-0ca33156f40f@gmail.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2] checkpatch: fix missing
	whitespace in formatted email
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


On Wed, Oct 14, 2020 at 10:33 PM Aditya <yashsri421@gmail.com> wrote:

>
> On 13/10/20 11:46 am, Lukas Bulwahn wrote:
> >
> > On Tue, 13 Oct 2020, Dwaipayan Ray wrote:
> >
> >> Commit 0c01921e56f9 ("checkpatch: add new warnings to author signoff
> >> checks.") introduced new checks for author sign off. The format_email
> >> procedure was modified to add comment blocks to the formatted email. But
> >> no space was added between the email address and mail comment.
> >>
> >> This causes wrong email formatting in cases where the email is in the 
> form
> >> "author@example.com (Comment block)". The space between the address and
> >> comment block is removed, which causes incorrect parsing of the
> >> formatted email.
> >>
> >> An evaluation on checkpatch brought up this case. For example,
> >> on commit 1129d31b55d5 ("ima: Fix ima digest hash table key 
> calculation"),
> >> the following warning was reported:
> >>
> >> WARNING:BAD_SIGN_OFF: email address 'David.Laight@aculab.com (big 
> endian
> >> system concerns)' might be better as 'David.Laight@aculab.com(big 
> endian
> >> system concerns)'
> >>
> >> Add a single space in between the address and comment when the
> >> extracted comment is not empty.
> >>
> > Dwaipayan, looks good to me.
> >
> > So, how about a 'Fixes:' tag?
> >
> > Aditya, can you rerun your evaluation with this fix patch applied on top?
> >
> > Then, we need a comparison for:
> > 1. completely before vs. after the two patches, and
> > 2. after the first patch vs. after the two patches (to see that the fix 
> > works)
> >
> > More support on evaluation from others interested to become mentees are 
> of 
> > course welcome.
> >
> > Lukas
> >  
> >> Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
> >> ---
> >>  scripts/checkpatch.pl | 4 +++-
> >>  1 file changed, 3 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> >> index fab38b493cef..f1a4e61917eb 100755
> >> --- a/scripts/checkpatch.pl
> >> +++ b/scripts/checkpatch.pl
> >> @@ -1221,7 +1221,9 @@ sub format_email {
> >>      } else {
> >>              $formatted_email = "$name$name_comment <$address>";
> >>      }
> >> -    $formatted_email .= "$comment";
> >> +    if ("$comment" ne "") {
> >> +            $formatted_email .= " $comment";
> >> +    }
> >>      return $formatted_email;
> >>  }
> >>  
> >> -- 
> >> 2.27.0
> >>
> >>
> Hi Sir
>
> I have analyzed the reports using this patch and made comparison. The 
> links are as follows:
>
> 1. completely before vs. after this patch: 
> https://github.com/AdityaSrivast/kernel-tasks/blob/master/Task2/reports/analysis/relative_change/before_v_second/summary_relative.txt
> 2. after the first patch vs. after the two patches: 
> https://github.com/AdityaSrivast/kernel-tasks/blob/master/Task2/reports/analysis/relative_change/first_v_second/summary_relative.txt
>
> Kindly let me know if you have any questions.
>
> Aditya
>
>

Hi Sir
I have completed all the assigned tasks. What should be my next steps to participate as a mentee in the community bridge program?
Kindly guide me regarding it.

Thank You

Sincerely
Aditya

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
