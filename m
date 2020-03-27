Return-Path: <SRS0=IvWF=5M=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 497F7C2D0E8
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 27 Mar 2020 19:23:52 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 175D2206E6
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 27 Mar 2020 19:23:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ifzMe/Tu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 175D2206E6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id CA97B892AE;
	Fri, 27 Mar 2020 19:23:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0mcccDmUXGsN; Fri, 27 Mar 2020 19:23:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3CB868881C;
	Fri, 27 Mar 2020 19:23:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 31F20C1D7C;
	Fri, 27 Mar 2020 19:23:51 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 084C7C0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 27 Mar 2020 19:23:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id E9095888C3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 27 Mar 2020 19:23:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ARsQfyXj2lIw
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 27 Mar 2020 19:23:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com
 [209.85.219.49])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 0C66C8881C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 27 Mar 2020 19:23:49 +0000 (UTC)
Received: by mail-qv1-f49.google.com with SMTP id q73so5495761qvq.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 27 Mar 2020 12:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=COviC50TfGFFke5Tw6FIl+KemNZ2/egDJog7vCaVKUc=;
 b=ifzMe/TuudRoT+CFnffxuSXE2Abyfs+hlyv0moEMOcYdzds403xarRvKXiosRnVVUW
 cHQV1q2q9J6Ih8sOHnW8i2gOqTFGgz1me1wElaIvL57TMxhxSbaEyWtLMaZ4QVg85N6O
 +0kG/Gh9VNv4iem9CkUBGXiwRjyjKcMe1BhM9x316RjEv2id5XQwocQpsscHnHvX1BsD
 LaifObIHNcAbI4v6RqL6nYWtKx1qBkqQSXSp6tiMsXPQoNwqv7DMrBcDQUNbUDJ8dxxr
 vDWUMQDrT3fcyL7gWf+fN7nHBlFyA6aFyjweN7ACY3Dczcb2ekoWVhVMGxt0BrbWhOfd
 qO9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=COviC50TfGFFke5Tw6FIl+KemNZ2/egDJog7vCaVKUc=;
 b=rsp1reDuJS0xRI9vrj6UYir0SgU8DehzIYQHMZ2bb011hMWHG1Y5+apshbH9ofYsLz
 bM4/1ZeXbLY0WBMLpFpSeSQtsOUw4bwMQTsT8EsDdtMBldmc6vfYzlQhdz1WRwvvi2Hq
 EgFJGbjUOdPiiyzi0Rkd+AEi0fr/pxfcExCFSpFTk/oJJc99CbLaZ/ERzTDbO75pPnZ/
 UNiKqtLs4d+xSP84sGsOIavxhEpf/C6FchCnIMYqeayBHNvog9xJAECG9hSGHCLH/ohS
 ja46hQHNPc7BRQSOqV9HE1t+yPyJx2Fa94Otq2ddaJgNbRelrWlXktHZqN24oEMSn+bu
 NsGg==
X-Gm-Message-State: ANhLgQ3GcadIg+mBiAEG9CZCn17eFXbPVfXA9be4lRpqhq7aQpmhsOhR
 slkE908FrY5d+fEx21BXF1shGOKK
X-Google-Smtp-Source: ADFU+vvB8n8teTUhyOxLQ5F4QwAhqD54gntwJlHjoh4LT77Qg5Xn8TJ5o0ewobiCpjyCQe2jZREXzQ==
X-Received: by 2002:a0c:f709:: with SMTP id w9mr789932qvn.159.1585337027703;
 Fri, 27 Mar 2020 12:23:47 -0700 (PDT)
Received: from ?IPv6:2804:14d:72b1:8920:a2ce:f815:f14d:bfac?
 ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
 by smtp.gmail.com with ESMTPSA id u13sm4252326qku.92.2020.03.27.12.23.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Mar 2020 12:23:47 -0700 (PDT)
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
References: <20200323125732.281976-1-dwlsalmeida@gmail.com>
 <20200323125732.281976-4-dwlsalmeida@gmail.com>
 <20200327174740.5d5935ae@coco.lan>
 <a4066f72-ae83-c1ef-8bf7-d4bbcfa29b31@gmail.com>
Message-ID: <3c072783-59f4-ba0f-6634-978ca0e6ae49@gmail.com>
Date: Fri, 27 Mar 2020 16:23:42 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <a4066f72-ae83-c1ef-8bf7-d4bbcfa29b31@gmail.com>
Content-Language: en-US
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Hi Mauro, as always, thank you for reviewing my code!


Sorry for making you repeat yourself on the alignment of arguments and 
on multi-line comment syntax, I am aware of these and I thought I had 
fixed them all, but some just slip by sometimes.


 > As we talked via IRC in priv, the best would be to implement the MPEG_TS
 > generator as part of the bridge DVB driver.
 >
 > Anyway, I will review the code below assuming that you'll be moving the
 > implementation to the right place.

Yes. Please let me know when the changes in experimental/media-kconfig 
land, since I'd like to rename and move all the code - including the 
bridge I have been working on - to test_drivers/vidtv.


 > +static void dvb_dummy_fe_thread_mpeg_ts_tick(struct dvb_frontend *fe)
 > +{
 > +	struct dvb_dummy_fe_state *state = fe->demodulator_priv;
 > +	const unsigned int SLEEP_MSECS = 10;
 > +	u32 ticks = 0;
 > +	u32 i;
 > +	char *buf = kzalloc(DMX_BUF_LEN, GFP_KERNEL);
 > +	u32 buffer_offset;
 > +
 > +	struct dvb_dummy_table_pat pat = {0};
 > +	struct dvb_dummy_table_sdt sdt = {0};
 > I guess it is ok here, but allocating too much stuff at the stack is
 > dangerous. Linux Kernel stack is very small. Perhaps the best would
 > be to place those at the driver's private struct (with is allocated with
 > kalloc).
 >
Well, I wasn't aware of that, but most of the data for these tables are 
heap-allocated. How small are we talking about?

But your suggestion is OK with me as well. It would be even better if 
this entire function wasn't in this patch at all, since it will have to 
be moved to the bridge driver anyways.

The *_write_args structures are also pretty small.

 >> +
 >> +	struct dvb_dummy_table_pmt *pmt_sections;
 >> +
 >> +	struct dvb_dummy_table_pat_program *programs = NULL;
 >> +	struct dvb_dummy_table_sdt_service *services = NULL;
 >> +
 >> +	bool update_version_num = false;
 >> +	u16 pmt_pid;
 >> +
 >> +	programs = dummy_fe_pat_prog_cat_into_new(state->channels);
 >> +	services = dummy_fe_sdt_serv_cat_into_new(state->channels);
 >> +
 >> +	/* assemble all programs and assign to PAT */
 >> +	dummy_fe_pat_program_assign(&pat, programs);
 >> +
 >> +	/* assemble all services and assign to SDT */
 >> +	dummy_fe_sdt_service_assign(&sdt, services);
 >> +
 >> +	/* a section for each program_id */
 >> +	pmt_sections = kcalloc(pat.programs,
 >> +			       sizeof(struct dvb_dummy_table_pmt),
 >> +			       GFP_KERNEL);
 >> +
 >> +	dummy_fe_pmt_create_section_for_each_pat_entry(&pat,
 >> +						       pmt_sections);
 >> +
 >> +	dummy_fe_pmt_stream_match_with_sections(state->channels,
 >> +						pmt_sections,
 >> +						pat.programs);
 >> +
 >> +	dummy_fe_pat_table_init(&pat,
 >> +				update_version_num,
 >> +				TRANSPORT_STREAM_ID);
 >> +
 >> +	dummy_fe_sdt_table_init(&sdt,
 >> +				update_version_num,
 >> +				TRANSPORT_STREAM_ID);
 >> +	while (true) {
 >> +		memset(buf, 0, DMX_BUF_LEN);
 >> +		buffer_offset = 0;
 >> +
 >> +		if ((ticks % 50) == 0) {
 >> +			/* push PSI packets into the buffer */
 >> +
 >> +			buffer_offset +=
 >> +				dummy_fe_pat_write_into(buf,
 >> +							buffer_offset,
 >> +							&pat);
 >> +			for (i = 0; i < pat.programs; ++i) {
 >> +				pmt_pid =
 >> +				dummy_fe_pmt_get_pid(&pmt_sections[i],
 >> +						     &pat);
 >> +
 >> +				/* not found */
 >> +				WARN_ON(pmt_pid > LAST_VALID_TS_PID);
 >> +
 >> +				/* write each section into buffer */
 >> +				buffer_offset +=
 >> +				dummy_fe_pmt_write_into(buf,
 >> +							buffer_offset,
 >> +							&pmt_sections[i],
 >> +							pmt_pid);
 >> +			}
 >> +
 >> +			buffer_offset +=
 >> +				dummy_fe_sdt_write_into(buf,
 >> +							buffer_offset,
 >> +							&sdt);
 >> +
 >> +			WARN_ON(buffer_offset > DMX_BUF_LEN); /* overflow */
 >> +			msleep_interruptible(SLEEP_MSECS);
 > That doesn't sound right, for two reasons:
 >
 > 1) msleep_interruptible() can take less time than expected, if
 >    interupted;
 > 2) the time may vary a lot.
 >
 > I would use the high-res timer here, giving a range for it (maybe a 10ms
 > range?), e. g., something like:
 >
 > 			usleep_range(SLEEP_USECS, SLEEP_USECS + 10000);
 >
 >
 >
OK. I wonder if this will have to be rewritten in the future, since 
decoders will probably expect X amount of video/audio per Y amount of time?


As for buffer overflows, maybe a better strategy would be to use a 
dynamic array? I would wrap all memcpy() calls and call krealloc() as 
necessary. If we go with a big enough initial size (say, 20 TS packets) 
then this wouldn't happen very often, if at all. That would be a simple 
solution to completely eliminate this problem, in my opinion.


I don't know if there's a limit on how much data you can pass to the 
demux at once, but if there is, we can just split the buffer into 
smaller chunks when calling dmx_swfilter_packets(), since the amount of 
bytes actually present in the buffer will be a multiple of 188 anyways.


 > +	}
 > +
 > +	length += CRC_SIZE_IN_BYTES;
 > +
 > +	WARN_ON(length > SDT_MAX_SECTION_LEN);
 > even assuming that you fix the above code, and update "s" to the next
 > SDT data, this is still too dangerous: if are there any risk of going
 > past the buffer size, you should check *before* the bad condition 
happens,
 > e. g., something like:
 >
 > 	while (s && length + CRC_SIZE_IN_BYTES < SDT_MAX_SECTION_LEN) {
 > 		...
 > 	}
 >
 > 	if (s)
 > 		WARN_ON(length > SDT_MAX_SECTION_LEN);
 >
 >> +	return length;
 >> +}
 >> +

My understanding is that, e.g.

length > SDT_MAX_SECTION_LEN

doesn't mean that the buffer will necessarily overflow. It is just 
against the spec.


Best regards

- Daniel.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
