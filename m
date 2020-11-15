Return-Path: <SRS0=uYLy=EV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAA8CC2D0E4
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 15 Nov 2020 20:13:33 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36D7C223AB
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 15 Nov 2020 20:13:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GoqZoDcd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 36D7C223AB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id EA8C98610F;
	Sun, 15 Nov 2020 20:13:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y-2BooD7UX0X; Sun, 15 Nov 2020 20:13:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 96981860CD;
	Sun, 15 Nov 2020 20:13:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 83600C0891;
	Sun, 15 Nov 2020 20:13:32 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5F34AC07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 15 Nov 2020 20:13:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 5B06C860E6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 15 Nov 2020 20:13:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tP6ugtg8O0e7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 15 Nov 2020 20:13:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
 [209.85.166.68])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id BE682860CD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 15 Nov 2020 20:13:30 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id m9so15160760iox.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 15 Nov 2020 12:13:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pHLY2qOpNiUPVHKCZPDwd0lLkSH0TX6NIRb8NF84rpY=;
 b=GoqZoDcdWXTjDoAnfivWSRa9GCn/HcM3gm9wnpbTbu8aagLZO0biGhuBePy8G8Ap29
 obIVeiy8lUZx/TF7xELhxWk/e+x5iQbU+W02Vvn0WZXZJX82/92e+cXnoS1/8o/WPSmj
 +Chof0s9EhZncEs8tUbg4bojW6tl0uTTsB7Bkva1sTU/fcfxNX4HRbB0Noe6lbl4dKr8
 GGy071yH0GLH1qIv/FnAnN/e9AkY/5g4+onUeCVmnBWgj9queKlUryjvJvGvVrMUH2Bs
 0SfMOZ+4ROX1ci1FgZroWU+bj1UyLRHrCm2R0lZfWhb5uI02nrlqjFU9rgkkE33B2q5P
 9JMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pHLY2qOpNiUPVHKCZPDwd0lLkSH0TX6NIRb8NF84rpY=;
 b=N65C0k1NqsB7+h7lGU6PWs+T6cRpcf1sSikPF4mDJ+5I8Qvf4DfnFopKKoYvoVVk0x
 rRDjyUD7PjG876eWN/qtL+tyXElxOkSpggP+I9Svm0rz6S3gewHSYuOiAbZmUIAit5/c
 OdxymSJIzcHeeFvEVKpVpVDoReNBjbpLTuNNNr3369WFECMbCOpZGW+VIZPTFCLfCoEW
 YLoGTpD5CLgxxymUXc3oZQHd+9qhF3YprvO4k2RniOePLIOhdHZZodClrrTS5sMeg/jJ
 Qg1gIw18h3R8iER29mx2pmKsOTdM1LTMybVKv4c1Tayzt0ew2gcKy8EHdAlhDW/au1Gz
 FRJw==
X-Gm-Message-State: AOAM533R4ubtfHM6CKYhnc0H9LWlQqiI+BnSi674aFQGUQ92CRMQ4zSu
 9sXKNtDp1Euvr9GvBi7xVc10FBhPkUQDjuVRrJc=
X-Google-Smtp-Source: ABdhPJydyYyS1QJKhDg7hSaPQ7WIQAv6skbdZ5VyDp+BlGgGmDqlWoqJCcu3oymlgZ22tS5qNM0qWfFIl1qxMBgZ2Es=
X-Received: by 2002:a02:ba90:: with SMTP id g16mr8591510jao.96.1605471210142; 
 Sun, 15 Nov 2020 12:13:30 -0800 (PST)
MIME-Version: 1.0
References: <20201115171626.38478-1-dwaipayanray1@gmail.com>
In-Reply-To: <20201115171626.38478-1-dwaipayanray1@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Sun, 15 Nov 2020 21:13:19 +0100
Message-ID: <CAKXUXMy+fKU=RODBagFL8YzT4xdbSZMi3fHV3ATx=bLNPp-hRg@mail.gmail.com>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: Fix unescaped left
	brace
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

On Sun, Nov 15, 2020 at 6:16 PM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
>
> There is an unescaped left brace in a regex in OPEN_BRACE
> check. This throws a runtime error when checkpatch is run
> with --fix flag and the OPEN_BRACE check is executed.
>
> Fix it by escaping the left brace.
>

Can you find with 'git blame' which commit introduced this issue and
add a Fixes: tag?

Other than that, it looks good.

Lukas

> Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
> ---
>  scripts/checkpatch.pl | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 2749f32dffe9..0da6422cd0fd 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -4505,7 +4505,7 @@ sub process {
>                             $fix) {
>                                 fix_delete_line($fixlinenr, $rawline);
>                                 my $fixed_line = $rawline;
> -                               $fixed_line =~ /(^..*$Type\s*$Ident\(.*\)\s*){(.*)$/;
> +                               $fixed_line =~ /(^..*$Type\s*$Ident\(.*\)\s*)\{(.*)$/;
>                                 my $line1 = $1;
>                                 my $line2 = $2;
>                                 fix_insert_line($fixlinenr, ltrim($line1));
> --
> 2.27.0
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
