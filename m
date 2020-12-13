Return-Path: <SRS0=B2kz=FR=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F55DC4361B
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 13 Dec 2020 08:04:10 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD0AD22D6F
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 13 Dec 2020 08:04:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD0AD22D6F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 5352C20434;
	Sun, 13 Dec 2020 08:04:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tAPy62q2IaZN; Sun, 13 Dec 2020 08:04:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 05CEC20424;
	Sun, 13 Dec 2020 08:03:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E16F9C0893;
	Sun, 13 Dec 2020 08:03:59 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D8B13C013B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Dec 2020 08:03:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id D46C086BF3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Dec 2020 08:03:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KYWJXaSCmO13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Dec 2020 08:03:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f193.google.com (mail-il1-f193.google.com
 [209.85.166.193])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 1318286BEC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Dec 2020 08:03:58 +0000 (UTC)
Received: by mail-il1-f193.google.com with SMTP id g1so12920742ilk.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Dec 2020 00:03:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gwUyY3H0fXMUoo0WPLNRqvNyeqJ3Icfxp5RDofnD1fQ=;
 b=R5/1aVVOszNb9cAyzcSZlzDr/NoPtw9KGJJTolVqa/g1oPTPEP19sX88QV9Z0Rb/ek
 iMJtIAgLL9WSApEyiMeWopGzROmPiK1mH9yhcGPHngtWuAUDIuLwGGcfjTNj8Oviwixc
 fyKRNJ+DDfnVTTpFFwiDloQ6SQZYAf5BDBAmQJCaHqLGocO1As6NTCjhyeXsnbEvN7g3
 /mafcgRZXG0YRO6sWfGWmKFqXz8BuUREVSR+2KtjdiyyRx4SKdY47ZKe1HJALV3nP/tH
 Zvq05AlU0A1O6FlC5d2M34cCUUcjVYvXOV+PKk7h+zRhrSt6A7ELzp8XZm8g1dX0uyZz
 jRrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gwUyY3H0fXMUoo0WPLNRqvNyeqJ3Icfxp5RDofnD1fQ=;
 b=DGQsUVcW9EuYLyuwqi46FDVibLKQgLZsGZZC8M4Hc3oXYD3/Iq8Dq00co2IE22BK33
 0VEubD/AH1UghbBt/jX1PU/RKy9flgU1cptxJ5fYoRVNaf7FXK8RPINrxX4zmE30vSr1
 GWOKFWxBFiXEv7Ng7C+EXi0ygN3h8b/OAoZQ399h4opaW77AabQGJrOfY2O3nfp4GAj9
 2QAzSXfAlISBYhrAosv6/EdHBbqcQ1+BgaQbxhtZnqb1407gmscyOLhhUJ83bF2niJgc
 wDvP3oi+FDyFcCzcgRNx4xcpaJJRFU2Vtm91xL5d+hrohfSKD7UQaDz5Y6UcoQVO/Tr6
 6i0Q==
X-Gm-Message-State: AOAM533DSHvGN7RhG0YoadMYsJra3SAb4xNBgsgq71fPAl98Nh3Lw/B8
 L2aV113JMiyMwhgZk8VhW22dRm90YMnxI1PrzMQ=
X-Google-Smtp-Source: ABdhPJxCJyKzdVuUJPF/mGbHouqeR0ZMcbntHFSeHNfBHRnK7F2n/1sH5hozJwtLg2Nnu9xShFCR1J/4vH18cEMNVD8=
X-Received: by 2002:a92:cd8c:: with SMTP id r12mr26451389ilb.221.1607846637311; 
 Sun, 13 Dec 2020 00:03:57 -0800 (PST)
MIME-Version: 1.0
References: <20201209105833.9066-1-yashsri421@gmail.com>
 <CAKXUXMx_ypzYSCHLzQKY0Uq=M35V4kSd6aivCYBa8coR6jM0yw@mail.gmail.com>
 <bc8f9d46-1474-5470-aca4-c4470761efb6@gmail.com>
 <CAKXUXMz=AwR+3gPprE6eSkPxuXgVVTpXBe5yKV7tQNuaTPP9mg@mail.gmail.com>
 <0e52c716-25e8-398e-8269-27613d5775f8@gmail.com>
In-Reply-To: <0e52c716-25e8-398e-8269-27613d5775f8@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Sun, 13 Dec 2020 09:03:46 +0100
Message-ID: <CAKXUXMytLeZ6czkg6Ezjp1BFV1NQM5rraJn76bxFN6N5CBDccA@mail.gmail.com>
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

On Sat, Dec 12, 2020 at 10:13 AM Aditya <yashsri421@gmail.com> wrote:
>
> On 9/12/20 10:39 pm, Lukas Bulwahn wrote:
> > On Wed, Dec 9, 2020 at 4:59 PM Aditya <yashsri421@gmail.com> wrote:
> >>
> >> On 9/12/20 5:17 pm, Lukas Bulwahn wrote:
> >>> On Wed, Dec 9, 2020 at 11:58 AM Aditya Srivastava <yashsri421@gmail.com> wrote:
> >>>>
> >>>> Currently, checkpatch warns if the user compares expression with boolean.
> >>>>
> >>>> E.g., running checkpatch on commit 3b3a1a0b7824 ("staging: rtl8723bs:
> >>>> hal: Modify comparison to constant in rtl8723bs_xmit.c") reports:
> >>>>
> >>>> CHECK: Using comparison to true is error prone
> >>>> +       if (ret == true)
> >>>>
> >>>> Provide a fix by replacing the expression with preferred expression. i.e.,
> >>>>
> >>>> 1) If the check is for a 'true' or 'not false' expression, the operand
> >>>> will get replaced with empty string.
> >>>>
> >>>> 2) Else, the operand gets replaced with '!', and the arguments follow.
> >>>>
> >>>
> >>> Can you show the test cases you used to test this?
> >>>
> >> Yes, I ran it over certain commits.
> >>
> >> Eg 1) commit 5c789e131cbb ("netfilter: nf_conncount: Add list lock and
> >> gc worker, and RCU for init tree search"), where
> >>
> >> 1.i)
> >> +       if (list->dead == true) {
> >> gets changed to:
> >> +       if (list->dead) {
> >>
> >> 1.ii)
> >> +               if (rbconn->list.count == 0 && rbconn->list.dead == false) {
> >> gets changed to:
> >> +               if (rbconn->list.count == 0 && !rbconn->list.dead) {
> >>
> >> E.g. 2) commit 83ee6ec7740b75dc0db (Staging: rtl8723bs: os_dep: Fix
> >> if-else coding style issues) where
> >>
> >> 2.i)
> >> +       if (padapter->bDriverStopped == true) {
> >> gets changed to:
> >> +       if (padapter->bDriverStopped) {
> >>
> >> 2.ii)
> >> +       if (pwrpriv->bInSuspend == true) {
> >> gets changed to:
> >> +       if (pwrpriv->bInSuspend) {
> >>
> >> 2.iii)
> >> +       if (pwrpriv->bInSuspend == false) {
> >> gets changed to:
> >> +       if (!pwrpriv->bInSuspend) {
> >>
> >>> Can you show all findings of this rule on the current rc or linux-next?
> >>>
> >>
> >> I have generated report on last 10k commits of latest next branch,
> >> where the check was found to be reported 5 times.
> >>
> > 5 times in 10k commits? I am really wondering how you select the fix
> > options you work on?
> >
> > Do you consider this relevant when the number is so low?
> > Are there potentially other classes that are much more relevant instead?
> >
> > Can you run it over all files in the repository instead of git commits?
> >
> > Commits really do not help when we want to fix this in the current kernel.
> >
>
> Hi
> So, I ran  grep -e
> "==\s*true\|==\s*false\|!=\s*true\|!=\s*false\|true\s*==\|false\s*==\|true\s*!=\|false\s*!="
> . -R over the repo.
> We currently have ~1630 such occurrences in different files.
>
> Detail findings can be found here:
> https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/bool_comparison/file_results.txt
>
> A large amount of these occurrences are found in drivers/, with
> "drivers/gpu/drm/amd/display/dc/dml/" having most occurrences.
>
> What do you think?
>

I suggest you submit a few patches correcting this style to a few
driver maintainers to see if they are in favor of this checkpatch
rule.

Lukas

> Thanks
> Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
