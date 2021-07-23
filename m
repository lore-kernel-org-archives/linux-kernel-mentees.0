Return-Path: <SRS0=pZ6u=MP=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 035D6C43214
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 23 Jul 2021 07:39:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A36E960E8E
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 23 Jul 2021 07:39:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A36E960E8E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 651CB606D3;
	Fri, 23 Jul 2021 07:39:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1mvnKdZSq_4u; Fri, 23 Jul 2021 07:39:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 76B0D6063E;
	Fri, 23 Jul 2021 07:39:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5726AC0010;
	Fri, 23 Jul 2021 07:39:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BAE3EC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Jul 2021 07:39:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9556C83A4D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Jul 2021 07:39:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 59QJSTW7OHh8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Jul 2021 07:39:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-vk1-xa34.google.com (mail-vk1-xa34.google.com
 [IPv6:2607:f8b0:4864:20::a34])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F0C8C83A4B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Jul 2021 07:39:16 +0000 (UTC)
Received: by mail-vk1-xa34.google.com with SMTP id t204so203063vkt.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Jul 2021 00:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=f81AeXx7cW1H3wFFlkNSSzDwfIE5Uw3dq6XzQh6DXzo=;
 b=G/DRP3pwg1oB9zROU4DtYNZfGmUoVwfk00HksrWSwe6HCjZz3qhU+eBSgcrAGjoqRx
 CidjQn4ZKRPSaENhNohmElqY+Q0379Knb0kXhraHvDoCd6BYRtF6XnkDaOBVCJp6nIPf
 rd/zIiv3zYuq1ZKxNQ/Vqws602d1XPAHjqGGuStpaJ+NEO3YK42LbPUMWXKyACYB7hDI
 reb0H0KL38MAiOlk41Mb2/8ZDzurtnonUcbV7jTREXri4YvsuN273GJlAeUaTIdw6NWA
 JrxgVHBnfINPN2mpDOPhzMvsjDDFT185fqk8GKywFZbtoo1HCNEsk3MLKHuN0AYYGrW+
 519g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=f81AeXx7cW1H3wFFlkNSSzDwfIE5Uw3dq6XzQh6DXzo=;
 b=ofMXRgLT99c7crf7VOEpXPE/JdcW7300OGGp4gM9BpDlh+RNA2SUCKukHwQeWjPP61
 h/zuLBoZZwcg0mJmC2GIwY0Qu3Z6ItL9LTw9gmSLcE0rDqW9+6Azg6/8t66JPfRevoXY
 IrfFqWi7Ug0+FHCwj/FpGMtu0vGaU4X8HufNQJCywebSPJ/zNyjcXmaFA3aawLbSEXyG
 wvBWJXUtSe1kJaOR7fYyvUWmUV7nD0H6ID3L35HAXzgFkiz5keyUXt/TIMtGz59Z4Ylz
 PsLV+k+6dxZHXrdEqpm3wQDz9Uwh2zTdISjHS5mJ1lBtfieUySQDoxmpZn853y8AfkKM
 gO6g==
X-Gm-Message-State: AOAM531qddGK7EzPjdZhDFfGbQYkBl+4yYbwf6iIvwDy34poJn+WJrh+
 ZeOa7eYdJOSy4JsmENU0uq+Sq8xwn1BajFJo44a7dvDVtu5a0A==
X-Google-Smtp-Source: ABdhPJxc/uOVaOSbzZ0XknqOEgQaCwdiAzO1UiaT7yVuYA8sQ2q/rOZs0gYJw4OntoNRIWN/QPNkYRt/o22aHikif0U=
X-Received: by 2002:ac5:c7cb:: with SMTP id e11mr2359859vkn.14.1627025955369; 
 Fri, 23 Jul 2021 00:39:15 -0700 (PDT)
MIME-Version: 1.0
From: 4PS19CS059 Mahendra Reddy <reddymahendra52@gmail.com>
Date: Fri, 23 Jul 2021 13:09:03 +0530
Message-ID: <CAFY-XHQpxUbKhPwh1MOBEuDd6H0_tYfP6BMQfhh9qBeX5tsqKQ@mail.gmail.com>
Subject: Checkpatch Documentation Mentorship Program
To: linux-kernel-mentees@lists.linuxfoundation.org
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
Content-Type: multipart/mixed; boundary="===============2578824235451848070=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============2578824235451848070==
Content-Type: multipart/alternative; boundary="0000000000001c364705c7c580d8"

--0000000000001c364705c7c580d8
Content-Type: text/plain; charset="UTF-8"

I am interested in the Checkpatch Documentation mentorship program and I
would like to work on the tasks for the mentee selection.

--0000000000001c364705c7c580d8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span style=3D"color:rgb(33,37,41);font-family:Poppins,Rob=
oto,&quot;Helvetica Neue&quot;,Arial,sans-serif;font-size:12.8px;white-spac=
e:pre-line">I am interested in the Checkpatch Documentation mentorship prog=
ram and I would like to work on the tasks for the mentee selection.</span><=
br></div>

--0000000000001c364705c7c580d8--

--===============2578824235451848070==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============2578824235451848070==--
