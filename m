Return-Path: <SRS0=QKD6=6U=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A781C4724C
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  6 May 2020 06:56:36 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 55CA420838
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  6 May 2020 06:56:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pivKrwZ/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 55CA420838
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2A67786DEE;
	Wed,  6 May 2020 06:56:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kQwV8yPT6VOi; Wed,  6 May 2020 06:56:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 90E5B85A70;
	Wed,  6 May 2020 06:56:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 79BA5C0863;
	Wed,  6 May 2020 06:56:35 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EB111C0859
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  6 May 2020 06:56:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id D091520441
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  6 May 2020 06:56:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3FAxN7CfbWxF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  6 May 2020 06:56:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
 [209.85.222.195])
 by silver.osuosl.org (Postfix) with ESMTPS id B6350203E3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  6 May 2020 06:56:32 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id c10so921964qka.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 05 May 2020 23:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:message-id:in-reply-to:references:subject
 :mime-version:content-transfer-encoding:content-disposition;
 bh=g4mEA7psFAWfP/DWFOVbhOa2yXPpZxwLT+x2aAr3dAA=;
 b=pivKrwZ/HTtBb+GDV6/M/JoLtcHXR0gIYHTZ4/6TZM5xpSQGxykyVkZDVz8bDymHkV
 lcgbRo+8zU/CC4AVratnDce6eRa9D0L+xgZEUlBm/0cBd0P7qRx7JFBLTMProGfnTDdg
 8bz7f/Ui6q590m1nF2UFuVF2ATuIRhqeYB9VOhq55RFTI3iEcgVGacuaje9KBRBwAp1o
 oxYX66Ru10kQXCcPvp7aQ1BRMeYu+bfDrJqwxCu1yDw2X3FW1uJyk8sOweamUxRXaiq9
 iIStVtBR/7HlURHAgeetpcnALl44ntx00aVB55g7s05Oc9epBwlbox7Ofn1xhBg/Kix4
 O5Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:message-id:in-reply-to
 :references:subject:mime-version:content-transfer-encoding
 :content-disposition;
 bh=g4mEA7psFAWfP/DWFOVbhOa2yXPpZxwLT+x2aAr3dAA=;
 b=UwrlYc1lhIaheQs/d4egeQARlZLWzeWVQYDDSmL55iH9LQUqBp2kMIoZHAcsC56mld
 nwfTssEH90RcB80qpyeIs7Ey4PHTCf4J38UkEJbWK4u1whiNMJsg0daRS1KtdnRq6hGI
 OgrZgYawZTs4hUlMvtEEiLPbdUFUKpNnTLEAj1LNMiuQkVHw/4mv4aO7voW6INanHudP
 Kv/s/4JxrYZ+wMwFic3JG5OWKcJf/UR7/X4BUyatTjewQj1kpMf2/9y/a3SAw5i40mWB
 jSM7PZO+/aqb+Am8mfyww13bAwlFR6IsVhbME1wbmCJ9Ck1ym3iw0p+RiKffopWy11Ep
 t/CQ==
X-Gm-Message-State: AGi0PuZ079mEim0xd72QcerjBQIQwzV7wp6U8iHaHj5ObiR+LtPUp2rk
 f31KkY/7Z8JozZ4kGz405f4=
X-Google-Smtp-Source: APiQypKlfwOaA5T0mzX83+5/WFryXYBnpEehLpnP7Em4tqgoXyObmhQrRr9uzeaiU2/q/09o0gFtTw==
X-Received: by 2002:a05:620a:65a:: with SMTP id
 a26mr6952049qka.323.1588748191584; 
 Tue, 05 May 2020 23:56:31 -0700 (PDT)
Received: from dwls-dell ([177.193.195.148])
 by smtp.gmail.com with ESMTPSA id b19sm1018449qkg.72.2020.05.05.23.56.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 05 May 2020 23:56:31 -0700 (PDT)
Date: Wed, 6 May 2020 03:55:48 -0300
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Message-ID: <40C2F764-6E43-418B-8904-952C5E99D9D9@getmailspring.com>
In-Reply-To: <20200503101621.50047b5c@coco.lan>
References: <20200503101621.50047b5c@coco.lan>
X-Mailer: Mailspring
MIME-Version: 1.0
Content-Disposition: inline
Cc: "=?utf-8?Q?kstewart=40linuxfoundation.org?="
 <kstewart@linuxfoundation.org>, "=?utf-8?Q?sean=40mess.org?=" <sean@mess.org>,
 "=?utf-8?Q?linux-kernel=40vger.kernel.org?=" <linux-kernel@vger.kernel.org>,
 "=?utf-8?Q?tglx=40linutronix.de?=" <tglx@linutronix.de>,
 "=?utf-8?Q?linux-kernel-mentees=40lists.linuxfoundation.org?="
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 "=?utf-8?Q?allison=40lohutok.net?=" <allison@lohutok.net>,
 "=?utf-8?Q?linux-media=40vger.kernel.org?=" <linux-media@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] [RFC, WIP,
 v4 09/11] media: vidtv: implement a PES packetizer
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

Hi Mauro,


> As commented, don't use WARN_ON(). At most, you could use WARN_ON_ONCE(),
> as otherwise, you may end by causing serious performance issues if
> the code starts to produce a flood of warnings at the dmesg.
> 
> I would use pr_warn_ratelimit() on all such cases.
> 

OK.




> I don't like the idea of changing the "from" buffer endiannes, copy
> and then restore it back to the original state. Is this really needed?
> 
> I would, instead, define:
> 
> 	struct pes_header {
> 	...
> 		__be32 bitfield;
> 		__be16 length;
> 	...
> 	};
> 
> Then wherever you would touch them:
> 
> 	u32 bitfield;
> 	u16 len;
> 
> 	/* Write into BE fields */
> 	pes_header.bitfield = cpu_to_be32(bitfield);
> 	pes_header.length = cpu_to_be16(len);
> 
> 	/* Read from BE fields */
> 	bitfield = be32_to_cpu(pes_header.bitfield);
> 	len = be16_to_cpu(pes_header.length);
> 
> 
> As a side effect, when you use "__be16" and "__be32" types, gcc
> and smatch/sparse will warn you if you mess with endiannes.
> 
> Same applies to similar code elsewhere.
> 

I don't like it either, it is error prone. I did not know about this
other possibility. Does this work for _bitfields_ though?

I think the authors for libdvbv5 used unions precisely so bswap() could
be called on a 'bitfield' member and from then on the bitfields could be
accessed directly, e.g.:

	union {
		u16 bitfield; <-- call bswap() on this
		struct {
                        --> then use these directly:
			u8  syntax:1;
			u8  zero:1;
			u8  one:2;
			u16 section_length:12;
		} __packed;
	} __packed

At least that's what I understood.

I found this: 
https://lwn.net/Articles/741762/

Maybe *_get_bits, *_replace_bits is the equivalent that I should use for bitfields?

Because I'd rather not do this:

> 	u32 bitfield;
> 	/* Write into BE fields */
> 	pes_header.bitfield = cpu_to_be32(bitfield);

Since I'd have to write the (many!) bitwise operations myself and I'm
sure I will mess this up at _some_ point.



thanks,
- Daniel


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
