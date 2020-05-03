Return-Path: <SRS0=gpyO=6R=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C94B9C47257
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  3 May 2020 07:06:46 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8FE9B2075B
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  3 May 2020 07:06:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="V3K20RJQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8FE9B2075B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6CBFB87D14;
	Sun,  3 May 2020 07:06:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8rfeOANgInfm; Sun,  3 May 2020 07:06:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 47AAD87B92;
	Sun,  3 May 2020 07:06:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2CF08C0176;
	Sun,  3 May 2020 07:06:45 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DB210C0175
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  3 May 2020 07:06:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id C323C88688
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  3 May 2020 07:06:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T5KmdjFCUEHn
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  3 May 2020 07:06:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id F2E8788686
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  3 May 2020 07:06:42 +0000 (UTC)
Received: from coco.lan (ip5f5ad5c5.dynamic.kabel-deutschland.de
 [95.90.213.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CDB2B2078E;
 Sun,  3 May 2020 07:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588489602;
 bh=/TuUmS/lUQz6LYPGZt4r8qNTCPIMydP+HbiwVJRqEwU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=V3K20RJQBclm2rGRYlqbbl+oI4pMRqrnprtrA6Lzsk+zeg3Pblf/zwoJy9LzLvjDV
 avaSDWTPt5ML4bIeWqyvWUtPBy65X7VAsnE4lPcPGZgVoCmfurzS18xa5bK9QNBcl2
 Ozix+BJU6JXbN1s9GV4CAvw9Y1wcaIoL5W0AS6To=
Date: Sun, 3 May 2020 09:06:34 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Message-ID: <20200503090634.1b7ae548@coco.lan>
In-Reply-To: <20200502084038.07c38c4b@coco.lan>
References: <20200502032216.197977-1-dwlsalmeida@gmail.com>
 <20200502032216.197977-7-dwlsalmeida@gmail.com>
 <20200502084038.07c38c4b@coco.lan>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Cc: kstewart@linuxfoundation.org, sean@mess.org, linux-kernel@vger.kernel.org,
 tglx@linutronix.de, linux-kernel-mentees@lists.linuxfoundation.org,
 allison@lohutok.net, linux-media@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [RFC, WIP,
 v4 06/11] media: vidtv: add wrappers for memcpy and memset
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

Em Sat, 2 May 2020 08:40:38 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> escreveu:

> Em Sat,  2 May 2020 00:22:11 -0300
> "Daniel W. S. Almeida" <dwlsalmeida@gmail.com> escreveu:
> 

> > +u32 vidtv_memcpy(void *to,
> > +		 const void *from,
> > +		 size_t len,
> > +		 u32 offset,
> > +		 u32 buf_sz)
> > +{
> > +	if (buf_sz && offset + len > buf_sz) {
> > +		pr_err("%s: overflow detected, skipping. Try increasing the buffer size",
> > +		       __func__);
> > +		return 0;  
> 
> shouldn't it return an error?
> 
> > +	}
> > +
> > +	memcpy(to, from, len);
> > +	return len;
> > +}

When trying to use your memset wrapper, I noticed a few issues there.

The first one is that you should not use __func__ directly at pr_* macros.

Instead, just ensure that you have a pr_fmt() macro that ill be adding
the driver's name and the function, e. g.:

	#define pr_fmt(fmt) KBUILD_MODNAME ":%s: " fmt, __func__

Besides that, the parameter order sounded weird:

> > +u32 vidtv_memcpy(void *to,
> > +		 const void *from,
> > +		 size_t len,
> > +		 u32 offset,
> > +		 u32 buf_sz)

The "to", "offset" and "buf_sz" arguments refer to the "to" buffer,
while "from" and "len" refers to what will be copied from the "from"
into the "to" buffer. Please re-order it, placing first the "to"
args, then "from" arg, and finally the argument that applies to both,
e. g.: 

	size_t vidtv_memcpy(void *to, size_t to_offset, size_t to_size,
			    const void *from, size_t len)

(you should notice that I'm using size_t for all args there).

The same is also valid for the memset.

Finally, the places where this function is used require to pass twice
the offset (from patch 08/11):

> +		nbytes += vidtv_memcpy(args.dest_buf +
> +				       args.dest_offset +
> +				       nbytes,
> +				       &ts_header,
> +				       sizeof(ts_header),
> +				       args.dest_offset + nbytes,
> +				       args.dest_buf_sz);

That doesn't make much sense. I mean, if the arguments are "buf + offset",
one would expect that the "buf" would be the head of a buffer, and the
function would be adding the offset internally.

So, the best would be to re-define it like:

	/**
	 * vidtv_memcpy() - wrapper routine to be used by MPEG-TS
	 *		    generator, in order to avoid going past the
	 *		    output buffer.
	 * @to:	Starting element to where a MPEG-TS packet will
	 *		be copied.
	 * @to_offset:	Starting position of the @to buffer to be filled.
	 * @to_size:	Size of the @to buffer.
	 * @from:	Starting element of the buffer to be copied.
	 * @ten:	Number of elements to be copy from @from buffer
	 *		into @to+ @to_offset buffer.
	 *
	 * Note:
	 *	Real digital TV demod drivers should not have memcpy
	 *	wrappers. We use it here just because emulating a MPEG-TS
	 *	generation at kernelspace require some extra care.
	 *
	 * Return:
	 *	Returns the number of bytes 
	 */
	size_t vidtv_memcpy(void *to, size_t to_offset, size_t to_size,
			    const void *from, size_t len)
	{
		if unlikely(to_offset + len > to_size) {
			pr_err_ratelimited("overflow detected, skipping. Try increasing the buffer size\n");
			return 0;
		}
		memcpy(to + to_offset, from, len);
		return len;
	}

Thanks,
Mauro
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
