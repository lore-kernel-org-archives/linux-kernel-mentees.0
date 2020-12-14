Return-Path: <SRS0=WLyE=FS=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D721C4361B
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 14 Dec 2020 05:45:01 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5B80229EF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 14 Dec 2020 05:45:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C5B80229EF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 80F2687396;
	Mon, 14 Dec 2020 05:45:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rSVnK-Ms9pPC; Mon, 14 Dec 2020 05:45:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 265F18734B;
	Mon, 14 Dec 2020 05:45:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0A834C088E;
	Mon, 14 Dec 2020 05:45:00 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 93F6CC013B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Dec 2020 05:44:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 8B5888734B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Dec 2020 05:44:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 24Ep8EHGFexp
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Dec 2020 05:44:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
 [209.85.167.67])
 by hemlock.osuosl.org (Postfix) with ESMTPS id AEC8D87396
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Dec 2020 05:44:57 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id x20so7554118lfe.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Dec 2020 21:44:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WIHFPzucLxfHg5t865IEZrYAYhRIbfW/T/XX1gv0uS4=;
 b=FIDfE17FpAVmwlEDoXXjFJtEMO62X8oFqwyp7c30KdclQ6gfim6eZx7wAAfrGZ9m3y
 aW1HYbJpl0pnmI+AI6zGgLSwmp8tzwKiuf62DV7G7AxCNnwrGNT2U7FNOAxzxHznLUhY
 avc5HLipmiRQM+PTfMkEybvibZzIHS2zW7Mm9S0iytOzuXREdP33+4oDrf1jtfrZQVQx
 JpnJSdc1WwLaa5tanPjCwWzZv5xOwCVRXPuSKUDHDoaPjrDlSS8OGt/KCpDTRhRM99Ot
 Byx9D9JQQnfrYrwzzRRuVF7azXBZc+OCWsydYsbI4XRf1FBYl+IpWPNOtXGyV+31QI7r
 d1jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WIHFPzucLxfHg5t865IEZrYAYhRIbfW/T/XX1gv0uS4=;
 b=fw0JH9qEOHMrWYtczyKYcEFDg2rL9sts1DIMovDQjDePgAqJSv1+29uGjkpRSMqrQG
 RqOqQDMe/8DWoFk71YJ8ekrBYvu+XJ9/ubxscahx3ygRHDE2wz3Vco2OGVILBL/asIJc
 rWSgiBTFSevqDYM3DYuiEZEPD17d1dzadH1/ProLoodJIKaVCw4/4i6IpYythc26fcwB
 ccbdnjMKzEiVoGZQfT5bRxguHv3ellIF3Tx4u4rgHPjD8gaBJnv2riea0AjAeVKelFk1
 eD2p6n9QL2iFaw9CiRbRi9ZZm+NnyVUghje6PVvdI6DddPMfKQSvkGIj+G4gYTiSQzAP
 ZLSw==
X-Gm-Message-State: AOAM530l6T8ozaT6c/XBZKYp3DEcXFllT4JYALqlF89ujPgtHkjx4jPa
 LXkwExk8jpvoNhlw9tEA0RKzAjk8jeSFa9tX0lc=
X-Google-Smtp-Source: ABdhPJyELwIvjWVMfj3RkRG6YHnYWT8uu2oGcnOs9vtSEycKyLsIgSfVbU2FzkxTdCFXqgdrWzGiQJbcD6r2ash/H6I=
X-Received: by 2002:ac2:44c3:: with SMTP id d3mr3330967lfm.238.1607924695754; 
 Sun, 13 Dec 2020 21:44:55 -0800 (PST)
MIME-Version: 1.0
References: <20201213085927.33281-1-dwaipayanray1@gmail.com>
In-Reply-To: <20201213085927.33281-1-dwaipayanray1@gmail.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Mon, 14 Dec 2020 11:14:32 +0530
Message-ID: <CABJPP5DYuApo_vreOAq02ODxux-uU=W1X4VBqcZEVw+bj7Ao7w@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] scripts: add more corrections to
	spelling.txt
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

On Sun, Dec 13, 2020 at 2:29 PM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
>
> Analyzing misspellings over the past 10k commit messages,
> a few more corrections are added to spelling.txt
>
> Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
> ---
>  scripts/spelling.txt | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/scripts/spelling.txt b/scripts/spelling.txt
> index 953f4a2de1e5..cf2453ddb216 100644
> --- a/scripts/spelling.txt
> +++ b/scripts/spelling.txt
> @@ -315,6 +315,7 @@ commited||committed
>  commiting||committing
>  committ||commit
>  commoditiy||commodity
> +comon||common
>  comsume||consume

Lukas, if you are okay with the additions, should I send it off to
Andrew Morton?
He seems to have had the most commits for that file according to get_maintainers

Thank you,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
