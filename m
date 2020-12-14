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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 775EBC4361B
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 14 Dec 2020 05:50:37 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7FD2229EF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 14 Dec 2020 05:50:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D7FD2229EF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 999C520475;
	Mon, 14 Dec 2020 05:50:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J5FkkQCxit72; Mon, 14 Dec 2020 05:50:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id DE89E20470;
	Mon, 14 Dec 2020 05:50:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C82A3C088E;
	Mon, 14 Dec 2020 05:50:35 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 41C35C013B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Dec 2020 05:50:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 35BC685E27
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Dec 2020 05:50:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CCEx6CCSHg5Y
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Dec 2020 05:50:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f193.google.com (mail-il1-f193.google.com
 [209.85.166.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id AEDBD84524
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Dec 2020 05:50:32 +0000 (UTC)
Received: by mail-il1-f193.google.com with SMTP id c18so14720961iln.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Dec 2020 21:50:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=olKiSXGAGiPWwkLlyx5t/lSN5QSLYQObuMN4XgREIRI=;
 b=Ors3BTgckXIDmrB09tgYQXpE/MIf+XUXSLJ1A6uqaEVJUNHKQ7+IZY4W573ViB8yPm
 BZtSq9AXo9c6k55q81v/iYh77Nfqtwo9NRTbFfytaqNMUGo1c2IG4mssxNgsycixJBU7
 uabIEK4G7hrdwpgTehVa7kHeFiDbrZ2NWL+qKP6igSBPT3qiV5UQcy1FUOJCCXEx5dpn
 Fxj1ZMYLg6ftGarLAEha6Pi3+woTk/mJLSMzxByDcNipdpEl4sgm6o/YnP6u2PzT3EGb
 VhPMiijK9CNiM9phocWk9quAaWA1ND6jPNi9taqy4rcRqxsrggjzbkP9i0NAOYRq+lJR
 bMIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=olKiSXGAGiPWwkLlyx5t/lSN5QSLYQObuMN4XgREIRI=;
 b=gh91ug0AClEFDMaQKQoXLw0cHx9NRdl4MpFz0FjbUItuS/Z2DOZhnj9WWnjt12y940
 L14If6CNOupX5X6atJ7ynBGSIp9E+gNyfSiIwG/Pk0aS67QQIXI+chGI2KrlhI/6EcTw
 S26ZLQf7qxsVH8q0lNm9ToL2Zoeu/+v1pCzUyXZONB372+IaKM9f8kCZzy+QkXeop+rL
 82rR6jxD3aUze0M9uyJPl3CLPW1AjEY22yCQVQMv8NbtGJCxuu3/HfQAlAAYYbufIB3/
 64d2Wf8fSbuYjo1mVB/pDxtT9c+sxg0tY75Bvdl9dx7KiBiusYN7GXG73U3UliwXZjd8
 jOEA==
X-Gm-Message-State: AOAM531NRpAOUEy1fTtN8gBKH3Dy7vKqfMkX0F8oB1hMcPdQeaor7HcK
 6Pv85b31qGagEwplvF7CRs/0YZmFy/F5c77w218=
X-Google-Smtp-Source: ABdhPJypOYeYv6g+u3oxlsDbSNhu1Pd7CgaHEU/dC8UgXt4c/fTaki59A/j6N0x2JbacAg5at5coliuzfhaoSdQCbdg=
X-Received: by 2002:a92:512:: with SMTP id q18mr32462341ile.147.1607925032000; 
 Sun, 13 Dec 2020 21:50:32 -0800 (PST)
MIME-Version: 1.0
References: <20201213085927.33281-1-dwaipayanray1@gmail.com>
 <CABJPP5DYuApo_vreOAq02ODxux-uU=W1X4VBqcZEVw+bj7Ao7w@mail.gmail.com>
In-Reply-To: <CABJPP5DYuApo_vreOAq02ODxux-uU=W1X4VBqcZEVw+bj7Ao7w@mail.gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 14 Dec 2020 06:50:21 +0100
Message-ID: <CAKXUXMzEqpYFL4VSB0gRWGCOm2fqVngDS9A3Jv8OjPVPf5=KMg@mail.gmail.com>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
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

On Mon, Dec 14, 2020 at 6:44 AM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
>
> On Sun, Dec 13, 2020 at 2:29 PM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
> >
> > Analyzing misspellings over the past 10k commit messages,
> > a few more corrections are added to spelling.txt
> >
> > Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
> > ---
> >  scripts/spelling.txt | 18 ++++++++++++++++++
> >  1 file changed, 18 insertions(+)
> >
> > diff --git a/scripts/spelling.txt b/scripts/spelling.txt
> > index 953f4a2de1e5..cf2453ddb216 100644
> > --- a/scripts/spelling.txt
> > +++ b/scripts/spelling.txt
> > @@ -315,6 +315,7 @@ commited||committed
> >  commiting||committing
> >  committ||commit
> >  commoditiy||commodity
> > +comon||common
> >  comsume||consume
>
> Lukas, if you are okay with the additions, should I send it off to
> Andrew Morton?
> He seems to have had the most commits for that file according to get_maintainers
>

This probably should go to Joe and Andrew.

Joe will ack it; Andrew will pick it.

Be aware that the merge window is ongoing, so patch review might need
more time and then Christmas is coming up. That is really the one time
in the year, where kernel development visibly slows down (all other
holiday seasons are spread).

However, send it out, but keep track and maybe resend the patches that
were not noticed in the beginning of January.

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
