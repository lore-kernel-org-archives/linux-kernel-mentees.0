Return-Path: <SRS0=IvWF=5M=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DA7CC2D0E5
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 27 Mar 2020 19:56:32 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 332AC206F6
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 27 Mar 2020 19:56:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="vaq7myZl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 332AC206F6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1761287818;
	Fri, 27 Mar 2020 19:56:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QRReLUC56D2y; Fri, 27 Mar 2020 19:56:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 16EC38780E;
	Fri, 27 Mar 2020 19:56:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 136D3C1D7C;
	Fri, 27 Mar 2020 19:56:31 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BD933C0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 27 Mar 2020 19:56:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id AC675893BD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 27 Mar 2020 19:56:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JYsVpe5aflcm
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 27 Mar 2020 19:56:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 7AFDA893BA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 27 Mar 2020 19:56:28 +0000 (UTC)
Received: from coco.lan (ip5f5ad4d8.dynamic.kabel-deutschland.de
 [95.90.212.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3E542206F1;
 Fri, 27 Mar 2020 19:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1585338988;
 bh=q9WXsrVAL6OTb1WwQbjE+mN1RI4JRLTezgTAXhjgq1w=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=vaq7myZlzqh5SK0zW+NZefQzN4RuCf2xbL+GPs143vgesoWDWy3PSalgfMWniQEQy
 BS+4DVIcusHgX0ukebUqQW93KVRvc03FcYYZvQ4KrJeOGCYDbqfNQm/EKG9XaY4JA8
 IXli6derCT0d5KVa/0/w1nNEBRkZt0W5wFUYPRwM=
Date: Fri, 27 Mar 2020 20:56:22 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Message-ID: <20200327205622.5d7e8c81@coco.lan>
In-Reply-To: <a4066f72-ae83-c1ef-8bf7-d4bbcfa29b31@gmail.com>
References: <20200323125732.281976-1-dwlsalmeida@gmail.com>
 <20200323125732.281976-4-dwlsalmeida@gmail.com>
 <20200327174740.5d5935ae@coco.lan>
 <a4066f72-ae83-c1ef-8bf7-d4bbcfa29b31@gmail.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Cc: kstewart@linuxfoundation.org, sean@mess.org, tglx@linutronix.de,
 linux-kernel-mentees@lists.linuxfoundation.org, allison@lohutok.net,
 linux-media@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [RFC, WIP,
 v2 3/3] media: dvb_dummy_fe.c: write PSI information into DMX buffer
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

Em Fri, 27 Mar 2020 16:16:50 -0300
"Daniel W. S. Almeida" <dwlsalmeida@gmail.com> escreveu:

> Hi Mauro, as always, thank you for reviewing my code!
> 
> 
> Sorry for making you repeat yourself on the alignment of arguments and 
> on multi-line comment syntax, I am aware of these and I thought I had 
> fixed them all, but some just slip by sometimes.
> 
> 
> > As we talked via IRC in priv, the best would be to implement the MPEG_TS
> > generator as part of the bridge DVB driver.
> >
> > Anyway, I will review the code below assuming that you'll be moving the
> > implementation to the right place.  
> 
> Yes. Please let me know when the changes in experimental/media-kconfig 
> land, since I'd like to rename and move all the code - including the 
> bridge I have been working on - to test_drivers/vidtv.

Ok.

> 
> 
> > +static void dvb_dummy_fe_thread_mpeg_ts_tick(struct dvb_frontend *fe)
> > +{
> > +	struct dvb_dummy_fe_state *state = fe->demodulator_priv;
> > +	const unsigned int SLEEP_MSECS = 10;
> > +	u32 ticks = 0;
> > +	u32 i;
> > +	char *buf = kzalloc(DMX_BUF_LEN, GFP_KERNEL);
> > +	u32 buffer_offset;
> > +
> > +	struct dvb_dummy_table_pat pat = {0};
> > +	struct dvb_dummy_table_sdt sdt = {0};
> > I guess it is ok here, but allocating too much stuff at the stack is
> > dangerous. Linux Kernel stack is very small. Perhaps the best would
> > be to place those at the driver's private struct (with is allocated with
> > kalloc).
> >  
> Well, I wasn't aware of that, but most of the data for these tables are 
> heap-allocated. How small are we talking about?

On x86 is 8KB, I guess, but I've seen patches floating around proposing
changes (both increasing and decreasing). We try to avoid letting any
function to allocate more than a certain at the data on the heap. There is
a warning with sets a maximum limit per function. see for example those
commits:

	1a03f91c2c24 ("media: vivid: work around high stack usage with clang")
	03aa4f191a36 ("media: saa7146: avoid high stack usage with clang")

See also the FRAME_WARN config var at lib/Kconfig.debug:

	config FRAME_WARN
		int "Warn for stack frames larger than"
		range 0 8192
		default 2048 if GCC_PLUGIN_LATENT_ENTROPY
		default 1280 if (!64BIT && PARISC)
		default 1024 if (!64BIT && !PARISC)
		default 2048 if 64BIT

Please also notice that, when some features are enabled (like KASAN),
or when the compiler tries to do some kinds of optimization, the stack 
usage may increase a lot, easily going above that threshold when
someone adds struct vars to the stack.

So, when I see struct on heap, it rises me a mental flag that it could
have some problems.

This article helps to understand a little bit about the stack size:

	https://lwn.net/Articles/600644/

> 
> But your suggestion is OK with me as well. It would be even better if 
> this entire function wasn't in this patch at all, since it will have to 
> be moved to the bridge driver anyways.
> 
> The *_write_args structures are also pretty small.
> 
> >> +
> >> +	struct dvb_dummy_table_pmt *pmt_sections;
> >> +
> >> +	struct dvb_dummy_table_pat_program *programs = NULL;
> >> +	struct dvb_dummy_table_sdt_service *services = NULL;
> >> +
> >> +	bool update_version_num = false;
> >> +	u16 pmt_pid;
> >> +
> >> +	programs = dummy_fe_pat_prog_cat_into_new(state->channels);
> >> +	services = dummy_fe_sdt_serv_cat_into_new(state->channels);
> >> +
> >> +	/* assemble all programs and assign to PAT */
> >> +	dummy_fe_pat_program_assign(&pat, programs);
> >> +
> >> +	/* assemble all services and assign to SDT */
> >> +	dummy_fe_sdt_service_assign(&sdt, services);
> >> +
> >> +	/* a section for each program_id */
> >> +	pmt_sections = kcalloc(pat.programs,
> >> +			       sizeof(struct dvb_dummy_table_pmt),
> >> +			       GFP_KERNEL);
> >> +
> >> +	dummy_fe_pmt_create_section_for_each_pat_entry(&pat,
> >> +						       pmt_sections);
> >> +
> >> +	dummy_fe_pmt_stream_match_with_sections(state->channels,
> >> +						pmt_sections,
> >> +						pat.programs);
> >> +
> >> +	dummy_fe_pat_table_init(&pat,
> >> +				update_version_num,
> >> +				TRANSPORT_STREAM_ID);
> >> +
> >> +	dummy_fe_sdt_table_init(&sdt,
> >> +				update_version_num,
> >> +				TRANSPORT_STREAM_ID);
> >> +	while (true) {
> >> +		memset(buf, 0, DMX_BUF_LEN);
> >> +		buffer_offset = 0;
> >> +
> >> +		if ((ticks % 50) == 0) {
> >> +			/* push PSI packets into the buffer */
> >> +
> >> +			buffer_offset +=
> >> +				dummy_fe_pat_write_into(buf,
> >> +							buffer_offset,
> >> +							&pat);
> >> +			for (i = 0; i < pat.programs; ++i) {
> >> +				pmt_pid =
> >> +				dummy_fe_pmt_get_pid(&pmt_sections[i],
> >> +						     &pat);
> >> +
> >> +				/* not found */
> >> +				WARN_ON(pmt_pid > LAST_VALID_TS_PID);
> >> +
> >> +				/* write each section into buffer */
> >> +				buffer_offset +=
> >> +				dummy_fe_pmt_write_into(buf,
> >> +							buffer_offset,
> >> +							&pmt_sections[i],
> >> +							pmt_pid);
> >> +			}
> >> +
> >> +			buffer_offset +=
> >> +				dummy_fe_sdt_write_into(buf,
> >> +							buffer_offset,
> >> +							&sdt);
> >> +
> >> +			WARN_ON(buffer_offset > DMX_BUF_LEN); /* overflow */
> >> +			msleep_interruptible(SLEEP_MSECS);  
> > That doesn't sound right, for two reasons:
> >
> > 1) msleep_interruptible() can take less time than expected, if
> >     interupted;
> > 2) the time may vary a lot.
> >
> > I would use the high-res timer here, giving a range for it (maybe a 10ms
> > range?), e. g., something like:
> >
> > 			usleep_range(SLEEP_USECS, SLEEP_USECS + 10000);
> >
> >
> >  
> OK. I wonder if this will have to be rewritten in the future, since 
> decoders will probably expect X amount of video/audio per Y amount of time?

Well, nothing prevents that you keep waking at the same rate, but just
fill a larger buffer.

> As for buffer overflows, maybe a better strategy would be to use a 
> dynamic array? I would wrap all memcpy() calls and call krealloc() as 
> necessary. If we go with a big enough initial size (say, 20 TS packets) 
> then this wouldn't happen very often, if at all. That would be a simple 
> solution to completely eliminate this problem, in my opinion.

It should have an upper limit anyway, as we don't want to spend all Kernel
memory with MPEG frame generation.

> I don't know if there's a limit on how much data you can pass to the 
> demux at once, but if there is, we can just split the buffer into 
> smaller chunks when calling dmx_swfilter_packets(), since the amount of 
> bytes actually present in the buffer will be a multiple of 188 anyways.

The DVB core has a default size, but userspace can change it via 
DMX_SET_BUFFER_SIZE ioctl (most userspace apps do). The DVB framework 
will handle it as a circular buffer. When it is overflowed, it will
just starts over, overriding past data there.

> > +	}
> > +
> > +	length += CRC_SIZE_IN_BYTES;
> > +
> > +	WARN_ON(length > SDT_MAX_SECTION_LEN);
> > even assuming that you fix the above code, and update "s" to the next
> > SDT data, this is still too dangerous: if are there any risk of going
> > past the buffer size, you should check*before*  the bad condition happens,
> > e. g., something like:
> >
> > 	while (s && length + CRC_SIZE_IN_BYTES < SDT_MAX_SECTION_LEN) {
> > 		...
> > 	}
> >
> > 	if (s)
> > 		WARN_ON(length > SDT_MAX_SECTION_LEN);
> >  
> >> +	return length;
> >> +}
> >> +  
> 
> My understanding is that, e.g.
> 
> length > SDT_MAX_SECTION_LEN
> 
> doesn't mean that the buffer will necessarily overflow. It is just 
> against the spec.

Well, if it is against the spec, it could cause troubles at userspace
side. So, better to avoid it before it happens.

Thanks,
Mauro
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
