Return-Path: <SRS0=JFU2=FN=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45B77C1B0D9
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  9 Dec 2020 17:10:09 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B62A323BEF
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  9 Dec 2020 17:10:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B62A323BEF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5E2A287AAD;
	Wed,  9 Dec 2020 17:10:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yzuEffjucAcA; Wed,  9 Dec 2020 17:10:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9AC1E87908;
	Wed,  9 Dec 2020 17:10:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8E864C0893;
	Wed,  9 Dec 2020 17:10:05 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 87416C013B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Dec 2020 17:10:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 3D1AF20020
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Dec 2020 17:10:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o9HNr8RhsM09
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Dec 2020 17:10:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f196.google.com (mail-il1-f196.google.com
 [209.85.166.196])
 by silver.osuosl.org (Postfix) with ESMTPS id 44FD320513
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Dec 2020 17:10:02 +0000 (UTC)
Received: by mail-il1-f196.google.com with SMTP id c18so2241244iln.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 09 Dec 2020 09:10:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7TJI0hmpWCXqdEgDwBloxoLyiELBHOZNZvp49eSVNes=;
 b=GaizZcK0+nCkltj/yqDoylAHYn3aiimVX2J8ZDYH8X5cNd/4ZeB1FElj0xUKCaqsos
 0Y19+S4O36n2eW9NdP0O1hfTSXks94qkkMmjNlrGv3D0Vhq6yNSHp9EKTLLghYumq5Dd
 5nntPxxOdL01K2+ap+t9eWuZ8jUVC8y67Ptthn50eL5Med2/b9rG+au3TnwJ6j/21FCV
 gQV4bvn1lQBeMGC9OSNho0HjIjgBONfdFI4+mquQL93TP+2xoimQXhi2Rpg59c7NuKQS
 Bx+iilxWpmrO8i3JovF+ZquZYb8nFAojvpVMdbYsOjQMtE4w8BmYDq/aqRxII1XqkAeC
 JSxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7TJI0hmpWCXqdEgDwBloxoLyiELBHOZNZvp49eSVNes=;
 b=sQN39CL83AEJJ9Bz9gxNvo2fVacKWGpEl3LEzUveHF8YykwQ9BtE03yX09y4drrwSh
 S6+SBH9ekDUNRGkeCogUaScPVK3dmNePSEPngNciF9qLKdfUBQ9KaT1WpSr+rMRSTxnz
 TSyCSq0OjU9M2a8bextWy53WAXoDeuGG/inCXd2Bm8s3mVho3+qPbX7iE6ZNyZk63QXu
 V2bA9kmRKsUHEQzZD6IYTtoXZtpMMyez/GYqaxUWQnnnJQxtFQLhJKXWTuLv+x/si1Iv
 X12sDvyS248+f0CaROgzCZ7wXfNRfd3SknBi93zeSC1RpUqH4YN4bq3VmctdQXdHiscy
 SIag==
X-Gm-Message-State: AOAM530wMkMOgXfHSh6I8mwx6g2bqQl35D7q97Rp3nircTTETmStPvRM
 vBlb4pCLifqgO9/Z5PoQxXaOqCdb5hxa4rERGDI=
X-Google-Smtp-Source: ABdhPJxE0ktTApaYGaVyzYjBpFtG+RhEj9P0dTBAGQ8UDxO+7N7uWeCMRZGpye2Qd773Y98HTHDnPfyDNyEcMvX73is=
X-Received: by 2002:a92:a804:: with SMTP id o4mr4246511ilh.125.1607533801515; 
 Wed, 09 Dec 2020 09:10:01 -0800 (PST)
MIME-Version: 1.0
References: <20201209105833.9066-1-yashsri421@gmail.com>
 <CAKXUXMx_ypzYSCHLzQKY0Uq=M35V4kSd6aivCYBa8coR6jM0yw@mail.gmail.com>
 <bc8f9d46-1474-5470-aca4-c4470761efb6@gmail.com>
In-Reply-To: <bc8f9d46-1474-5470-aca4-c4470761efb6@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Wed, 9 Dec 2020 18:09:50 +0100
Message-ID: <CAKXUXMz=AwR+3gPprE6eSkPxuXgVVTpXBe5yKV7tQNuaTPP9mg@mail.gmail.com>
To: Aditya <yashsri421@gmail.com>
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

On Wed, Dec 9, 2020 at 4:59 PM Aditya <yashsri421@gmail.com> wrote:
>
> On 9/12/20 5:17 pm, Lukas Bulwahn wrote:
> > On Wed, Dec 9, 2020 at 11:58 AM Aditya Srivastava <yashsri421@gmail.com> wrote:
> >>
> >> Currently, checkpatch warns if the user compares expression with boolean.
> >>
> >> E.g., running checkpatch on commit 3b3a1a0b7824 ("staging: rtl8723bs:
> >> hal: Modify comparison to constant in rtl8723bs_xmit.c") reports:
> >>
> >> CHECK: Using comparison to true is error prone
> >> +       if (ret == true)
> >>
> >> Provide a fix by replacing the expression with preferred expression. i.e.,
> >>
> >> 1) If the check is for a 'true' or 'not false' expression, the operand
> >> will get replaced with empty string.
> >>
> >> 2) Else, the operand gets replaced with '!', and the arguments follow.
> >>
> >
> > Can you show the test cases you used to test this?
> >
> Yes, I ran it over certain commits.
>
> Eg 1) commit 5c789e131cbb ("netfilter: nf_conncount: Add list lock and
> gc worker, and RCU for init tree search"), where
>
> 1.i)
> +       if (list->dead == true) {
> gets changed to:
> +       if (list->dead) {
>
> 1.ii)
> +               if (rbconn->list.count == 0 && rbconn->list.dead == false) {
> gets changed to:
> +               if (rbconn->list.count == 0 && !rbconn->list.dead) {
>
> E.g. 2) commit 83ee6ec7740b75dc0db (Staging: rtl8723bs: os_dep: Fix
> if-else coding style issues) where
>
> 2.i)
> +       if (padapter->bDriverStopped == true) {
> gets changed to:
> +       if (padapter->bDriverStopped) {
>
> 2.ii)
> +       if (pwrpriv->bInSuspend == true) {
> gets changed to:
> +       if (pwrpriv->bInSuspend) {
>
> 2.iii)
> +       if (pwrpriv->bInSuspend == false) {
> gets changed to:
> +       if (!pwrpriv->bInSuspend) {
>
> > Can you show all findings of this rule on the current rc or linux-next?
> >
>
> I have generated report on last 10k commits of latest next branch,
> where the check was found to be reported 5 times.
>
5 times in 10k commits? I am really wondering how you select the fix
options you work on?

Do you consider this relevant when the number is so low?
Are there potentially other classes that are much more relevant instead?

Can you run it over all files in the repository instead of git commits?

Commits really do not help when we want to fix this in the current kernel.


Lukas

> Here are the generated msgs:
> https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/bool_comparison/last_10k.txt
>
> I have also generated the new CHK messages for BOOL_COMPARISON (over
> v4.13..v5.8) at:
> https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/bool_comparison/commitsv4.13..v5.8.txt
>
> which might give us a better idea for what how the lines will be replaced.
>
> Thanks
> Aditya
>
> > Lukas
> >
> >> Suggested-by: Joe Perches <joe@perches.com>
> >> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
> >> ---
> >> This fix is actually inspired from the comment mentioned in the script by Joe. I have added the Suggested-by line correspondingly.
> >>
> >>  scripts/checkpatch.pl | 7 +++++--
> >>  1 file changed, 5 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> >> index 8bd8e4518f7f..abd5a3d2e913 100755
> >> --- a/scripts/checkpatch.pl
> >> +++ b/scripts/checkpatch.pl
> >> @@ -6973,8 +6973,11 @@ sub process {
> >>                                         $op = "";
> >>                                 }
> >>
> >> -                               CHK("BOOL_COMPARISON",
> >> -                                   "Using comparison to $otype is error prone\n" . $herecurr);
> >> +                               if (CHK("BOOL_COMPARISON",
> >> +                                       "Using comparison to '$otype' is error prone. Perhaps use '${lead}${op}${arg}${trail}'\n" . $herecurr) &&
> >> +                                   $fix) {
> >> +                                       $fixed[$fixlinenr] =~ s/\b(?:true|false|$Lval)\s*(?:==|\!=)\s*(?:true|false|$Lval)\b/$op$arg/;
> >> +                               }
> >>
> >>  ## maybe suggesting a correct construct would better
> >>  ##                                 "Using comparison to $otype is error prone.  Perhaps use '${lead}${op}${arg}${trail}'\n" . $herecurr);
> >> --
> >> 2.17.1
> >>
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
