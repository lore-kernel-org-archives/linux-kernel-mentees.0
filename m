Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7361C7EE25
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 15 May 2023 11:04:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22F0660B9A;
	Mon, 15 May 2023 11:04:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 22F0660B9A
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=MpUkLvhN
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QBTJzpObV9ex; Mon, 15 May 2023 11:04:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 2B34060AAF;
	Mon, 15 May 2023 11:04:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B34060AAF
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0080BC0037;
	Mon, 15 May 2023 11:04:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 03565C002A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 May 2023 11:04:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C3F1082191
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 May 2023 11:04:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C3F1082191
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=MpUkLvhN
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jxF3ebR4yeP5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 May 2023 11:04:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7EA2482180
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7EA2482180
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 May 2023 11:04:39 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-96adcb66f37so441816066b.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 May 2023 04:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684148677; x=1686740677;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lERUo+WLdZx4JBH1Pw+XtLzFG1CgqVYgHbVRbkTw/zc=;
 b=MpUkLvhNClhT0+vzP2Wf7eEd6ur5TUAoj+zZSAkek414G63FLBv4no2rTUVduz4l9o
 qkQRw2DEssURnU9zbv5bHx5vD+nvhTvl8ea3XSimE6AOLO4oY0qpexU4ZSZg8IZ5fJmc
 fNzTTXcbVeNjkFD7KRdDF47H50mlVHyyX7IsGC3ri3KKZjxHL7CkiYH6MVa4xiDdClQN
 exzTJ/0ON2HEwQxZ9/vz+uw40MScC4o/fRjspKeyp+5Tfxx75YbqBTrmPWNZkrz2/9GE
 eyTLzYpJNPOP1M5XMjvE+pUt5Les/zp/XhJ+h1XFmMEDxwJvlILT6ZOd+dQk1qdcI/PQ
 uRfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684148677; x=1686740677;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=lERUo+WLdZx4JBH1Pw+XtLzFG1CgqVYgHbVRbkTw/zc=;
 b=V1MUUgGh7s3pbori0H1uJZwoh88Y8qcoY86Ee0K4hjk28o6q9vStT5AFx/wI40f0b1
 madMvxfc4EFBTaAWHE3SVzhtpeLjx0Hbaa1vzZgDsXVemjkfXZKEZAmmKBA53t6CKnz/
 oVBXhcy2M/VADFS11m3w86SB/Juz9Za87HpcNdMgOS4FWx8Wk9Kd4NHz0rFpUeJcR0bc
 Dkj2X7Nsyqw26j1rP5YHE1vQwbLE+z81nA/RG1KHX1pba80+X6KXh0K4XsTnbdBWQXSQ
 PYiC/bVUZGnn58pll5sqPtwcVUxAspaeSbQhHEp+QKYn4ROXwLktceZqxt7/WEOp5LJl
 /nhg==
X-Gm-Message-State: AC+VfDwUL/6o28+88QoGBPWQjRm5l4J2aVra+0bK9AeBBXKJ+jgIu5VN
 LK7Vxf/QBfvpsqFiFXnUUiU=
X-Google-Smtp-Source: ACHHUZ6wMR84Ke6Bj7QUjIoHhVknpSvv7L8BQTIL2uFttHnpEnLdiTBzHPFK9FhK4YNbXf1M57YKrQ==
X-Received: by 2002:a17:907:7e97:b0:968:4ce9:677a with SMTP id
 qb23-20020a1709077e9700b009684ce9677amr24562615ejc.38.1684148677324; 
 Mon, 15 May 2023 04:04:37 -0700 (PDT)
Received: from localhost ([146.70.133.78]) by smtp.gmail.com with ESMTPSA id
 de9-20020a1709069bc900b0094e6a9c1d24sm9520105ejc.12.2023.05.15.04.04.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 May 2023 04:04:36 -0700 (PDT)
Mime-Version: 1.0
Date: Mon, 15 May 2023 13:04:34 +0200
Message-Id: <CSMSVO8Z73NV.3MX3FRNO026T9@vincent-arch>
Subject: Re: [PATCH v1] drivers: pci: introduce configurable delay for
 Rockchip PCIe bus scan
From: "Vincenzo Palazzo" <vincenzopalazzodev@gmail.com>
To: "Peter Geis" <pgwipeout@gmail.com>, "Bjorn Helgaas" <helgaas@kernel.org>
X-Mailer: aerc 0.15.1
References: <CSK8M39MQL2C.3S7JO031H0BA2@vincent-arch>
 <ZF7m1npzLZmawT8Y@bhelgaas>
 <CAMdYzYqV72=pQa-U3a2N7MZ2ChBNL74QrxHQLbMZJxiftTK9sA@mail.gmail.com>
In-Reply-To: <CAMdYzYqV72=pQa-U3a2N7MZ2ChBNL74QrxHQLbMZJxiftTK9sA@mail.gmail.com>
Cc: kw@linux.com, heiko@sntech.de, Will Deacon <will@kernel.org>,
 robh@kernel.org, linux-pci@vger.kernel.org, shawn.lin@rock-chips.com,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com,
 linux-rockchip@lists.infradead.org, broonie@kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>, bhelgaas@google.com,
 Robin Murphy <robin.murphy@arm.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, lpieralisi@kernel.org,
 linux-arm-kernel@lists.infradead.org, Dan Johansen <strit@manjaro.org>
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

> >
> > There *is* a way for a PCIe device to say "I need more time".  It does
> > this by responding to that Vendor ID config read with Request Retry
> > Status (RRS, aka CRS in older specs), which means "I'm not ready yet,
> > but I will be ready in the future."  Adding a delay would definitely
> > make a difference here, so my guess is this is what's happening.
> >
> > Most root complexes return ~0 data to the CPU when a config read
> > terminates with UR or RRS.  It sounds like rockchip does this for UR
> > but possibly not for RRS.
> >
> > There is a "RRS Software Visibility" feature, which is supposed to
> > turn the RRS into a special value (Vendor ID == 0x0001), but per [1],
> > rockchip doesn't support it (lspci calls it "CRSVisible").
> >
> > But the CPU load instruction corresponding to the config read has to
> > complete by reading *something* or else be aborted.  It sounds like
> > it's aborted in this case.  I don't know the arm64 details, but if we
> > could catch that abort and determine that it was an RRS and not a UR,
> > maybe we could fabricate the magic RRS 0x0001 value.
> >
> > imx6q_pcie_abort_handler() does something like that, although I think
> > it's for arm32, not arm64.  But obviously we already catch the abort
> > enough to dump the register state and panic, so maybe there's a way to
> > extend that?
>
> Perhaps a hook mechanism that allows drivers to register with the
> serror handler and offer to handle specific errors before the generic
> code causes the system panic?

This sounds to me a good general solution that also help to handle 
future HW like this one.

So this is a Concept Ack for me.

Cheers!

Vincent.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
