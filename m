Return-Path: <SRS0=JFU2=FN=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A804C4361B
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  9 Dec 2020 11:48:04 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DABBB23B5D
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  9 Dec 2020 11:48:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DABBB23B5D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7387E87785;
	Wed,  9 Dec 2020 11:48:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aLrKrJOGenQV; Wed,  9 Dec 2020 11:48:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id F0E9787780;
	Wed,  9 Dec 2020 11:48:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id ED95EC0893;
	Wed,  9 Dec 2020 11:48:02 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6216DC013B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Dec 2020 11:48:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 508C986CC0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Dec 2020 11:48:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yIE3WFRNqmS5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Dec 2020 11:48:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f195.google.com (mail-il1-f195.google.com
 [209.85.166.195])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 8CD3F86CA1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Dec 2020 11:48:01 +0000 (UTC)
Received: by mail-il1-f195.google.com with SMTP id p5so1243020ilm.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 09 Dec 2020 03:48:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HqMS4JYbn+CuSeTePiCc4RBbD0He4cZ0kB1WR//RZzo=;
 b=LWfFx2xHIdxg+NA3nScwLE1vkrisPOEDMF2ADCZEXSiTVWyk+I7Nk88CcbpIQon71t
 2cggDGlY3CUuDoOQ45I/m2j23leMRWBKDkXYBMpIYMCaknXEwSJwSUc9amuybthkAqaD
 13bHhTpJVvq4FHwuCYC/l7YXxCz/MGZLRTo7gWr9wMtLE0ihdxrPAOL6S80HBgOdr9fx
 MmFN268gQ4C5JegxdkBxM5vXN0qheWb24HjBLhXFJGE/CopSCpKb7j9m6aRzviud1T6R
 S5i7+Xb6xcI0aK8F82KFmKK+cVWK2C3RQzEifMIXILcygfAThuasohTD9jERzveGXQnn
 4/fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HqMS4JYbn+CuSeTePiCc4RBbD0He4cZ0kB1WR//RZzo=;
 b=Q1Mwigqyyeyr9q5wN7dr8xESQ7Vx1EI95wO9lQ6uHrzHx84uUlfCyZMAYBa41hYD94
 sP75BdjbhAI2Byw/fnwTi8R3Rc0k6bpi8OWd4FBwQmRL21gtXgtUCKpJPzvWawc7eJ6A
 E8iA3QclJ0eYZOMiONGiSFtUz6h7EGYM8CS9U5WfZhJaP0ilbpdKaP97C+WqNRbXRH3m
 yUzfz8Y/vA+CP3Uh58mfusA1IYF+JsEIBIuvQMrz8EdqI/PrbfrA5QmGyIb347QoTOFz
 LWyy8QZ1CGBefD15XxrwWKxk+zIak0z03kNORMRwAWrfd4DgoKsuaUSRtBZPBxgX0MaX
 vt/w==
X-Gm-Message-State: AOAM532V8vYeJjWtHmA4mwqE/+vAuyEZxn4BP5K0aIgFSZDLmzMOucnc
 +F/crSqMv1Oc9o/rwlKPA0orwYqqKJ2WMSYkXo4=
X-Google-Smtp-Source: ABdhPJxtLmxbAVxvf48g8AiSQLjyPnx9b7HMEtxuPODj1I+oTy2ULFxFCVUGs8nRf3V7Mb8CazbQ0sM8Lbil/3ODzhU=
X-Received: by 2002:a92:512:: with SMTP id q18mr2276777ile.147.1607514480743; 
 Wed, 09 Dec 2020 03:48:00 -0800 (PST)
MIME-Version: 1.0
References: <20201209105833.9066-1-yashsri421@gmail.com>
In-Reply-To: <20201209105833.9066-1-yashsri421@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Wed, 9 Dec 2020 12:47:49 +0100
Message-ID: <CAKXUXMx_ypzYSCHLzQKY0Uq=M35V4kSd6aivCYBa8coR6jM0yw@mail.gmail.com>
To: Aditya Srivastava <yashsri421@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: add fix option and
	improve msg for BOOL_COMPARISON
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

On Wed, Dec 9, 2020 at 11:58 AM Aditya Srivastava <yashsri421@gmail.com> wrote:
>
> Currently, checkpatch warns if the user compares expression with boolean.
>
> E.g., running checkpatch on commit 3b3a1a0b7824 ("staging: rtl8723bs:
> hal: Modify comparison to constant in rtl8723bs_xmit.c") reports:
>
> CHECK: Using comparison to true is error prone
> +       if (ret == true)
>
> Provide a fix by replacing the expression with preferred expression. i.e.,
>
> 1) If the check is for a 'true' or 'not false' expression, the operand
> will get replaced with empty string.
>
> 2) Else, the operand gets replaced with '!', and the arguments follow.
>

Can you show the test cases you used to test this?

Can you show all findings of this rule on the current rc or linux-next?

Lukas

> Suggested-by: Joe Perches <joe@perches.com>
> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
> ---
> This fix is actually inspired from the comment mentioned in the script by Joe. I have added the Suggested-by line correspondingly.
>
>  scripts/checkpatch.pl | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 8bd8e4518f7f..abd5a3d2e913 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -6973,8 +6973,11 @@ sub process {
>                                         $op = "";
>                                 }
>
> -                               CHK("BOOL_COMPARISON",
> -                                   "Using comparison to $otype is error prone\n" . $herecurr);
> +                               if (CHK("BOOL_COMPARISON",
> +                                       "Using comparison to '$otype' is error prone. Perhaps use '${lead}${op}${arg}${trail}'\n" . $herecurr) &&
> +                                   $fix) {
> +                                       $fixed[$fixlinenr] =~ s/\b(?:true|false|$Lval)\s*(?:==|\!=)\s*(?:true|false|$Lval)\b/$op$arg/;
> +                               }
>
>  ## maybe suggesting a correct construct would better
>  ##                                 "Using comparison to $otype is error prone.  Perhaps use '${lead}${op}${arg}${trail}'\n" . $herecurr);
> --
> 2.17.1
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
