Return-Path: <SRS0=QKD6=6U=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 341F1C47259
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  6 May 2020 08:59:35 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F130C2075A
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  6 May 2020 08:59:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="0d2LMF3d"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F130C2075A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B7DAE86856;
	Wed,  6 May 2020 08:59:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lfmV-sRpgdZt; Wed,  6 May 2020 08:59:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8EE3586C18;
	Wed,  6 May 2020 08:59:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6F2A3C0863;
	Wed,  6 May 2020 08:59:33 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D3593C0859
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  6 May 2020 08:59:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id AD08E8511F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  6 May 2020 08:59:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o4Vf6Q5SuzH1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  6 May 2020 08:59:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 15FEC84CA5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  6 May 2020 08:59:31 +0000 (UTC)
Received: from coco.lan (ip5f5ad5c5.dynamic.kabel-deutschland.de
 [95.90.213.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DF198206B8;
 Wed,  6 May 2020 08:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588755570;
 bh=BZXsrGPAq0ynniSVougrqqFVO9Q9Qs8HW3VY67EvUxU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=0d2LMF3dWC0+omwbsoSjSumt5lIAZWiaKCxqTMeQDHkSF0iSN1gV6SZFWqFf7mVko
 w/ITUeNWxJJMjZ9R4lvXJjCMTewj+wJHZ3RyHtfNWQ5dfapxd9NQ7B4kZ10Whw+voB
 b2gEcrMi22UeGSzjelMxolxYk+XHP/IWEzSNmQoI=
Date: Wed, 6 May 2020 10:59:25 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Message-ID: <20200506105925.0bff8984@coco.lan>
In-Reply-To: <40C2F764-6E43-418B-8904-952C5E99D9D9@getmailspring.com>
References: <20200503101621.50047b5c@coco.lan>
 <40C2F764-6E43-418B-8904-952C5E99D9D9@getmailspring.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Cc: "kstewart@linuxfoundation.org" <kstewart@linuxfoundation.org>,
 "sean@mess.org" <sean@mess.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 "allison@lohutok.net" <allison@lohutok.net>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
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

Em Wed, 6 May 2020 03:55:48 -0300
"Daniel W. S. Almeida" <dwlsalmeida@gmail.com> escreveu:

> Hi Mauro,
> 
> 
> > As commented, don't use WARN_ON(). At most, you could use WARN_ON_ONCE(),
> > as otherwise, you may end by causing serious performance issues if
> > the code starts to produce a flood of warnings at the dmesg.
> > 
> > I would use pr_warn_ratelimit() on all such cases.
> >   
> 
> OK.
> 
> 
> 
> 
> > I don't like the idea of changing the "from" buffer endiannes, copy
> > and then restore it back to the original state. Is this really needed?
> > 
> > I would, instead, define:
> > 
> > 	struct pes_header {
> > 	...
> > 		__be32 bitfield;
> > 		__be16 length;
> > 	...
> > 	};
> > 
> > Then wherever you would touch them:
> > 
> > 	u32 bitfield;
> > 	u16 len;
> > 
> > 	/* Write into BE fields */
> > 	pes_header.bitfield = cpu_to_be32(bitfield);
> > 	pes_header.length = cpu_to_be16(len);
> > 
> > 	/* Read from BE fields */
> > 	bitfield = be32_to_cpu(pes_header.bitfield);
> > 	len = be16_to_cpu(pes_header.length);
> > 
> > 
> > As a side effect, when you use "__be16" and "__be32" types, gcc
> > and smatch/sparse will warn you if you mess with endiannes.
> > 
> > Same applies to similar code elsewhere.
> >   
> 
> I don't like it either, it is error prone. I did not know about this
> other possibility. Does this work for _bitfields_ though?

See my comment below.

> I think the authors for libdvbv5 used unions precisely so bswap() could
> be called on a 'bitfield' member and from then on the bitfields could be
> accessed directly, e.g.:
> 
> 	union {
> 		u16 bitfield; <-- call bswap() on this
> 		struct {
>                         --> then use these directly:  
> 			u8  syntax:1;
> 			u8  zero:1;
> 			u8  one:2;
> 			u16 section_length:12;
> 		} __packed;
> 	} __packed
> 
> At least that's what I understood.

You should double-check the structs from the specs. If I'm not mistaken,
bytes were swapped on some places. As I commented for patch 08/11,
the focus there were to make life simpler for userspace, and not to
store a precise copy of the byte order.

> 
> I found this: 
> https://lwn.net/Articles/741762/
> 
> Maybe *_get_bits, *_replace_bits is the equivalent that I should use for bitfields?

I never used them, but, based on their definition:

static __always_inline base type##_get_bits(__##type v, base field)	\
{									\
	return (from(v) & field)/field_multiplier(field);		\
}

Calling be16_get_bits should do the right cast to the type.

I don't know what the "from()" and "to()" macros would do.

I guess you will need to do some tests to see if this works as
expected.

> 
> Because I'd rather not do this:
> 
> > 	u32 bitfield;
> > 	/* Write into BE fields */
> > 	pes_header.bitfield = cpu_to_be32(bitfield);  
> 
> Since I'd have to write the (many!) bitwise operations myself and I'm
> sure I will mess this up at _some_ point.

If you mess up, gcc (and/or smatch) will complain. I mean,

if bitfield is declared as __be32, if you do:

	u32 bitfield;
	pes_header.bitfield = bitfield;

this will produce warnings.

Thanks,
Mauro
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
