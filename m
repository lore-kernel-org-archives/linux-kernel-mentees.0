Return-Path: <SRS0=Fc4Z=M5=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B1B0C432BE
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  6 Aug 2021 15:25:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E252561163
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  6 Aug 2021 15:25:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E252561163
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A672040581;
	Fri,  6 Aug 2021 15:25:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MpC1ZbuOuyd5; Fri,  6 Aug 2021 15:25:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id CBF2B40580;
	Fri,  6 Aug 2021 15:25:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A65F2C0010;
	Fri,  6 Aug 2021 15:25:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7E13FC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Aug 2021 15:25:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5A685607F9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Aug 2021 15:25:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yVC4UOOjgdox
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Aug 2021 15:25:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [IPv6:2607:f8b0:4864:20::72f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 306F7607E9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Aug 2021 15:25:05 +0000 (UTC)
Received: by mail-qk1-x72f.google.com with SMTP id w197so8939636qkb.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 06 Aug 2021 08:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=htn+KC45JPXgdQQRBHraJG0ZwdJ+V4DisE+VQG9yd9M=;
 b=IAW3jeTnw+l6ogmoJymBMLU6Los4l7xpem+ONI4Qy6ioUCIH5AF7Krk3n11ujWok50
 aSUHuklD7GyMLFS3exr+q5GSMO89hxeWef3a8R6hcilhvY6DnIOeEmr+kCLS6fk3AM2y
 DgshQ9Or81BDgN60ltevII5sylrQWF9thx6PH2uUTZzUBWkKBI/K77aPl8XqCZ7fePrZ
 Wh0f30LDdxj0eZDhiL2ujlk/rxLW7Vg6BdKb5jcIy7nTCM3DuRvS7RKxqbep7+1UAVQA
 AVTgsZcqO4w8FjxBQ7gcDz9INwJlYub86erPbCkX29Th9EoS0hBZdJat0xnTKPWqjlJ1
 rPSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=htn+KC45JPXgdQQRBHraJG0ZwdJ+V4DisE+VQG9yd9M=;
 b=PFvibF2dNx0w/ppPPuhkI46jiJDpDP5kueK67vWNW+8tEIsNGALecFGRD/7KLax1K9
 7NiVYAhv9f+Fst9sxPGjt2cTdMbBtBfF6IvJBox12r2Vwq+hU7/0jMEEuOeWMWeViUby
 zVH/KKS2P25Nk3nTDHkMU1r2i7dBwUJsjj6IZBVdEcO2UIF9NStI27rs1QFO03s5XFsP
 kDvtKuMKTRQvQe3esNeHTU0AIGtNxJEyUwBzqZ3t/L41AmPqUJchNQ0hT91h/EIQyT53
 WFwVTIlSw4/kpP1l/QwOOLAq4kFnt0p9vdt6YfQKz+WfGxE5E2W5p8XeO4uygpR/4Bo6
 VcZQ==
X-Gm-Message-State: AOAM53310q9mWhCkgDDuPG5GDZMB0x6PjN49GMbU1P502Z3RaORdha0C
 F6EEWgrewPjOHcbUGmcX5BZird0l98hbHMrYmPY=
X-Google-Smtp-Source: ABdhPJzAyN71bwGmp2U8Ga078ww1blBIqOa1CzvF1M9lvai6pubVoMy8392fzHGiY1L0w/4pasLE62BKbaPKD1Gg614=
X-Received: by 2002:a05:620a:290a:: with SMTP id
 m10mr10252945qkp.377.1628263503943; 
 Fri, 06 Aug 2021 08:25:03 -0700 (PDT)
MIME-Version: 1.0
References: <CAMqN5U6TDXVsJy3YEw-QOY9saktrWpNELtNKnBW9VegdQG2x3Q@mail.gmail.com>
 <CABJPP5AUm4fmiNPem3S1pw-S89E70H4UoVyGRq_vmCef1B4Qvw@mail.gmail.com>
 <CAMqN5U5Dwd8Jya8ETOffHFtRxaecSHAqJCUjyi+hygjPuSzOFw@mail.gmail.com>
 <CAKXUXMzWSAjPfA70rJhuLkcEL5zJTrcJy2NL=OsoGu7bjabX1Q@mail.gmail.com>
In-Reply-To: <CAKXUXMzWSAjPfA70rJhuLkcEL5zJTrcJy2NL=OsoGu7bjabX1Q@mail.gmail.com>
From: Vinesh Vilas Raut <vineshraut2017@gmail.com>
Date: Fri, 6 Aug 2021 20:54:51 +0530
Message-ID: <CAMqN5U7d_DJGwrHUnZ464yvE7DoEORXTy+M_=HdoJPAUrB1+sQ@mail.gmail.com>
Subject: Re: LFX Mentorship application
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
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

On Mon, Aug 2, 2021 at 10:50 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> We found 9 cases in the kernel tree:
>
> drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c:355:
> WARNING:UNNECESSARY_CASTS: unnecessary cast may hide bugs, see
> http://c-faq.com/malloc/mallocnocast.html
> drivers/message/fusion/mptlan.c:863: WARNING:UNNECESSARY_CASTS:
> unnecessary cast may hide bugs, see
> http://c-faq.com/malloc/mallocnocast.html
> drivers/message/fusion/mptlan.c:1009: WARNING:UNNECESSARY_CASTS:
> unnecessary cast may hide bugs, see
> http://c-faq.com/malloc/mallocnocast.html
> drivers/message/fusion/mptlan.c:1051: WARNING:UNNECESSARY_CASTS:
> unnecessary cast may hide bugs, see
> http://c-faq.com/malloc/mallocnocast.html
> drivers/net/ethernet/freescale/fs_enet/mac-fcc.c:150:
> WARNING:UNNECESSARY_CASTS: unnecessary cast may hide bugs, see
> http://c-faq.com/malloc/mallocnocast.html
> drivers/net/ethernet/freescale/fs_enet/mac-fec.c:134:
> WARNING:UNNECESSARY_CASTS: unnecessary cast may hide bugs, see
> http://c-faq.com/malloc/mallocnocast.html
> drivers/net/ethernet/qlogic/qlcnic/qlcnic_ctx.c:572:
> WARNING:UNNECESSARY_CASTS: unnecessary cast may hide bugs, see
> http://c-faq.com/malloc/mallocnocast.html
> drivers/video/fbdev/goldfishfb.c:241: WARNING:UNNECESSARY_CASTS:
> unnecessary cast may hide bugs, see
> http://c-faq.com/malloc/mallocnocast.html
> include/rdma/ib_verbs.h:2272: WARNING:UNNECESSARY_CASTS: unnecessary
> cast may hide bugs, see http://c-faq.com/malloc/mallocnocast.html
>
> Can you please check which of these cases should be refactored (so the
> checkpatch warning points to a valid suggestion to refactor the code)
> or if checkpatch is wrong with its suggestion and why?
>
Here, all 9 cases are valid suggestion by checkpatch.
above 9 cases(file) can be refactor without any functional change.
So, should I create a patches for those files ?

-Vinesh Raut
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
