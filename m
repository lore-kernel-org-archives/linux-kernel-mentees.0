Return-Path: <SRS0=Guts=D3=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46D9FC4363A
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 20 Oct 2020 17:36:05 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9EA0A2222D
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 20 Oct 2020 17:36:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qFeznhEr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9EA0A2222D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0662D8627E;
	Tue, 20 Oct 2020 17:36:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BOQZaI3q-UUV; Tue, 20 Oct 2020 17:36:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7D69785C9A;
	Tue, 20 Oct 2020 17:36:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 70601C088B;
	Tue, 20 Oct 2020 17:36:03 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AEB56C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 20 Oct 2020 17:36:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id A3513872D5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 20 Oct 2020 17:36:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3hecr3n3q271
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 20 Oct 2020 17:36:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com
 [209.85.210.49])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 7F279872B9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 20 Oct 2020 17:36:00 +0000 (UTC)
Received: by mail-ot1-f49.google.com with SMTP id d28so2476065ote.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 20 Oct 2020 10:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=jUtHL1zz64+HgEbc+QYsU5Wf3DliA6MQ26V5PfGv1xA=;
 b=qFeznhErr+NbHFM6oDL+Z4EpPr4E0cBY8xTmereXW2Tla0qiE5jojZvSDvhv3gUWPz
 auZTOkJ0ywPMENvvJCXK+SVFcNbSDtbGbC/qz5rtChnB9i5yL+xmri2nOAaVT7PS5Xkc
 t0cgExVqHLYMO8+kJtt43HkPNPo7/xaMU4aQK6UPpSQMAqqWUgfoSrDPdxL1HXpnCQ7x
 5KHd01xaWlMHiBP9Uz3ab9HP0X8HwOJGn8BxZzEuS6pPkoUsMYqB4C/WCs6OIKz3ut+h
 LUA72clvCerft07n7xn6Wn8jYSqqJzqDVSRUZtxuTe8o1BT4PU8N7G/lj/Xm4DQA/qlm
 ceag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=jUtHL1zz64+HgEbc+QYsU5Wf3DliA6MQ26V5PfGv1xA=;
 b=Fobs6zWcFM4hSjAb/tGLLCBVy+dKKf/e+CZeNXGwl6TxrcDTe0SVdg5LU43D3ta2f7
 cYMihgabvhexfCD7VSAqQyTisIOVUvqM+7B7GxvbhVDH/Yj21P4u9Rclg0i2u2K7ioaO
 98L1UwYrbQrW8d1S2mMxVr4KaHyC2jVYYx5gSm1oN8Yo7kJTcPC3Jxy22j2mLljiIAou
 CndNy0JukN2K76AY6gQUYDdOz/yCuWv93eN+xWJCqDSDe2ptDJphTlwVrFYMdkRKH7Ub
 cz6VvFjKZKbv0YAANyQTLOoPg4GPP7xXy6AroaV4o30/lbw4J6xdxbt/gZX2WQzo98Pv
 GtjQ==
X-Gm-Message-State: AOAM530cnnrzVG/6zXydYn65Mv6EI8PllzrcjNX2pEGcyfBgyzsy/mjS
 RFwmrMq+iB/9XagjeHhPtazKvbK7a4sps27up24=
X-Google-Smtp-Source: ABdhPJwDdXVsWzwIVuHoyhES4qxy/Z+eFL25kpPPcbJDT49wnBWwbnBNnH0prO0yQVHD9WwGr8Sat1tccpmMgV4X/NM=
X-Received: by 2002:a9d:1ca6:: with SMTP id l38mr2661059ota.30.1603215359470; 
 Tue, 20 Oct 2020 10:35:59 -0700 (PDT)
MIME-Version: 1.0
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Tue, 20 Oct 2020 23:05:31 +0530
Message-ID: <CABJPP5AF9s_qx=7Ory-4ZrwY7bEP9nAAtbzadozfwNPU_ymTEA@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] checkpatch: improving comment parsing in
	email
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

Hi,
checkpatch seems to have problems parsing some types of
email comments. Some examples I could find were of the type:

1) address@example.com (Comment)
2) "Name (Comment) " address@example.com
3) address@example.com #comment

These comments aren't processed currently which causes
false BAD_SIGN_OFF warnings.

Examples are:

WARNING:BAD_SIGN_OFF: email address 'David.Laight@aculab.com
(big endian system concerns)' might be better as 'David.Laight@aculab.com
(big endian system concerns)'

WARNING:BAD_SIGN_OFF: email address 'stable@vger.kernel.org #4.20+'
might be better as 'stable@vger.kernel.org#4.20+'

The earlier warning is very frequent in the kernel.

I did send a patch solving (1 and 3),
https://lore.kernel.org/linux-kernel-mentees/a15a6cc0ddea068d78113f5e315eaba6f52b917a.camel@perches.com/

Joe points out that comments and multiple comments can
exist at any part of email. (perhaps RFC 5322 Appendix A.5). So
that patch didn't solve the problem at the very root.

What do you recommend be done?

Thanks,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
