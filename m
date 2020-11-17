Return-Path: <SRS0=gqjg=EX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 125A3C2D0E4
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 17 Nov 2020 10:23:05 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D7F022202
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 17 Nov 2020 10:23:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mRbX2ACc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D7F022202
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id B8DFF87152;
	Tue, 17 Nov 2020 10:23:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id funF7H5NdjEI; Tue, 17 Nov 2020 10:23:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 52F498712B;
	Tue, 17 Nov 2020 10:23:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3AFFCC0891;
	Tue, 17 Nov 2020 10:23:03 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 38EF3C07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 10:23:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 2476E86684
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 10:23:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Yung5dwAyuhj
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 10:23:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f194.google.com (mail-il1-f194.google.com
 [209.85.166.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 6214A85682
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 10:23:01 +0000 (UTC)
Received: by mail-il1-f194.google.com with SMTP id q1so18056252ilt.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 02:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5HWWlYYgkFo/7Wm4ecE5u9NzaKgqucQQNaK/iYJ41A4=;
 b=mRbX2ACc+QGKfLGf15sHSkYwsRQI10KfNV9Aea49iMZ4t3JzGtIkmgvfQZ4q6DVIFp
 uFIwz0GoHkczqjzQCQJCN49WMeRZzoJ+N18bDYxMpq1DanvkXQQdXLKtSabH2iQMh6tF
 QgEpniuu/125ATAmwhhxB4/Bpr0/r4PTDO9cc2CQD5xOgzJcYR5WF26ZHTQq9fFN0V6N
 t5WyM1WWx66RWeCTBn1kHONoq8oWTGhk0xB0YAGkx6qE8wArdTRGFIkx+b2OHf0lm4WD
 RARB6sNYC8zeP+wjZn9Sbo9blcIYWNIGef1bNM8AKxqNFGJB8IOv9qVRDaL98PAa7JSc
 76PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5HWWlYYgkFo/7Wm4ecE5u9NzaKgqucQQNaK/iYJ41A4=;
 b=lC/gl6ApUQhs+gz9oW1Pzex+uc6FSL2KR4qBbBAS0MMMuB5CkikeGDE04+sVvy4CgA
 mdcK8NMGzomEHCiWTzVowu0IQaTyNI3mDbHRTWBsCt1BeyrUXgmzWPF/vYeiXNIWhXrk
 POHVwx+iJrsCxE5BeTnygqFOXmaAlWFs3gk+AqiDB3y7c9dQt+vMLCFx1RKm/8kVgEiy
 bVUpkrdQf8cTuqfzumo4KwWdoaSkTiac0OTjbQHoCmjusBGLtoOPEfygK73DzvmoOfVl
 LOBwFy7gHoZZlDyKpaVGuli2IQxMY0/mFlZSO9XFe2n8nAPkD7zmZ/1LmGCcKiDvusJK
 IgHg==
X-Gm-Message-State: AOAM531S/xKd077qWbvqwdTx1e9gOKQXwRtNHH11Iwn6J0AC0orn0QMx
 jFZW9ZV8yWyVEatE1bs+NaGO60xUfWuA835M1s8=
X-Google-Smtp-Source: ABdhPJynwEI6HgQLjP2Gw8mKbBFKTTuiLXUIH4WxIm5H1DcitHrOgnuHNQYblttLeBvMsyl7zccNJdgkvix1qPmtRqc=
X-Received: by 2002:a92:aacc:: with SMTP id p73mr9558340ill.64.1605608580705; 
 Tue, 17 Nov 2020 02:23:00 -0800 (PST)
MIME-Version: 1.0
References: <20201117095708.30454-1-yashsri421@gmail.com>
In-Reply-To: <20201117095708.30454-1-yashsri421@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Tue, 17 Nov 2020 11:22:49 +0100
Message-ID: <CAKXUXMxEs0rez_Cr4_u3_TtcL9v_J4QFT3Bq6jdH0wgvW2o7aA@mail.gmail.com>
To: Aditya Srivastava <yashsri421@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2] checkpatch: add fix option
	for ASSIGNMENT_CONTINUATIONS
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

On Tue, Nov 17, 2020 at 10:57 AM Aditya Srivastava <yashsri421@gmail.com> wrote:
>
> Currently, checkpatch warns us if an assignment operator is placed
> at the start of a line and not at the end of previous line.
>
> E.g., running checkpatch on commit 8195b1396ec8 ("hv_netvsc: fix
> deadlock on hotplug") reports:
>
> CHECK: Assignment operator '=' should be on the previous line
> +       struct netvsc_device *nvdev
> +               = container_of(w, struct netvsc_device, subchan_work);
>
> Provide a simple fix by appending assignment operator to the previous
> line and removing from the current line, if both the lines are additions
> (ie start with '+')
>
> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
> ---
> Changes in v2:
> add check if both the lines are additions (ie start with '+')
>

That makes sense.

Lukas

>  scripts/checkpatch.pl | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index c9aaaa443265..e0cb36369b2f 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -3542,8 +3542,14 @@ sub process {
>
>  # check for assignments on the start of a line
>                 if ($sline =~ /^\+\s+($Assignment)[^=]/) {
> -                       CHK("ASSIGNMENT_CONTINUATIONS",
> -                           "Assignment operator '$1' should be on the previous line\n" . $hereprev);
> +                       my $operator = $1;
> +                       if (CHK("ASSIGNMENT_CONTINUATIONS",
> +                               "Assignment operator '$1' should be on the previous line\n" . $hereprev) &&
> +                           $fix && $prevrawline =~ /^\+/) {
> +                               # add assignment operator to the previous line, remove from current line
> +                               $fixed[$fixlinenr - 1] .= " $operator";
> +                               $fixed[$fixlinenr] =~ s/$operator\s*//;
> +                       }
>                 }
>
>  # check for && or || at the start of a line
> --
> 2.17.1
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
