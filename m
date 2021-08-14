Return-Path: <SRS0=qR1B=NF=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73D16C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 14 Aug 2021 23:55:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F2BE860F4B
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 14 Aug 2021 23:55:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F2BE860F4B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8C4340314;
	Sat, 14 Aug 2021 23:55:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wa81yBWFXiS2; Sat, 14 Aug 2021 23:55:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id B75BC402C4;
	Sat, 14 Aug 2021 23:55:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9CE44C001A;
	Sat, 14 Aug 2021 23:55:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D821FC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 14 Aug 2021 23:55:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B3947400E5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 14 Aug 2021 23:55:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z8IQHLHJlfzR
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 14 Aug 2021 23:55:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E4B494010F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 14 Aug 2021 23:55:27 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 h63-20020a9d14450000b02904ce97efee36so16633221oth.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 14 Aug 2021 16:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=eqz3iHLoaTBov8XMNlx3iJTC3PQLCht5AuN6RyoaOg8=;
 b=Py0TvXUrxcJnQHNpk9wbO9fR44suKBpBwzAwm4/oSYLGzwzaVG4IES6bcSMxid0mWD
 ogy8zfZcIbYxnQ1c4EBZd2Ds/+tGiqTWyuVlxUT4cPIqGpbtwlcoGAAvAtxDN3XTwtqE
 Z0mes3zTp2o2tfrRFYGZzuYPXFFfnbE5duufCPubAAMSWKbL2Eh26dzoeJbzGWfBCS0p
 5P4b533cUIaokHoBnqPcMEik6t4Ytf/xwH3l67ycYXdDF8aIYrcKtVKwJ5pBWYIYGrVm
 dmVQSwxrX7JfTnizvLzly3gX68OVjbQVtRpeXmSZk4D1gs2gA7j9BWpNYCAlEVMC6uh2
 mr7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=eqz3iHLoaTBov8XMNlx3iJTC3PQLCht5AuN6RyoaOg8=;
 b=ngZAh5Z72KvvTAgrceytE3spxnvkvVcjWq9xWn7hgtPbt6zH8tjlcPnNy3Cd+83DCd
 hd4/s9yatYlYmxD/L5KDijvsSJW9W/dqKO4ZTrMsQd7KcKDsXX/F8GijXrmkynNsZ1sR
 JSKD35VzPFz20FSDK65vGKBv2JkfDFsaqVju6rTApsjgcl4ci3vvZcc0c31XOMGplMKO
 dsq1k1lRLSc7enrex5gztTSc2bWR05qFv3l5SnJWg8LBwwmoSgPYybT7dT4hJXIBBdsi
 YMAP8Th8r4EyeOzE07QBmx/MnvrgnaOqH1A3dwwD98iJcd89oahKt0atpgvpO26FXymV
 JM9Q==
X-Gm-Message-State: AOAM5336MidLpCcXertaUXIwP0yz9To6aebLAautQOwg/koyRc1zIHaw
 n+lUAonyogpoxM5473qypuvUak4QbfcOe0HlG70=
X-Google-Smtp-Source: ABdhPJy+zF7LvSvCelf7D0g9094pzZHUFVdvBWvDvH3vofFWToHYhEksfr41SCa0BRmxEkzYeEXD6iB5VJvzo072PZE=
X-Received: by 2002:a9d:6306:: with SMTP id q6mr7454077otk.290.1628985326975; 
 Sat, 14 Aug 2021 16:55:26 -0700 (PDT)
MIME-Version: 1.0
From: Khalid Mohammed <lightlord323@gmail.com>
Date: Sun, 15 Aug 2021 01:55:16 +0200
Message-ID: <CAPaDB6eTgEixHjU8P7RP8-NVLRALb8izdGc1nw=iQfBpfDTd3A@mail.gmail.com>
Subject: Mining Maintainers Mentorship
To: lukas.bulwahn@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org
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
Content-Type: multipart/mixed; boundary="===============3343526942292965231=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============3343526942292965231==
Content-Type: multipart/alternative; boundary="000000000000c2409605c98db3e7"

--000000000000c2409605c98db3e7
Content-Type: text/plain; charset="UTF-8"

I am interested in the Mining Maintainers mentorship program and I would
like to work on the tasks for the mentee selection.

--000000000000c2409605c98db3e7
Content-Type: text/html; charset="UTF-8"

<div dir="ltr">I am interested in the Mining Maintainers mentorship program and I would like to work on the tasks for the mentee selection.</div>

--000000000000c2409605c98db3e7--

--===============3343526942292965231==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============3343526942292965231==--
