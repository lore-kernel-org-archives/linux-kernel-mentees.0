Return-Path: <SRS0=IvWF=5M=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1067EC43331
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 27 Mar 2020 19:17:05 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF35C206E6
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 27 Mar 2020 19:17:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OH4DvcSr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF35C206E6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id A01DE87E93;
	Fri, 27 Mar 2020 19:17:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0pAOnLKXmnap; Fri, 27 Mar 2020 19:17:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 83D2F87E0B;
	Fri, 27 Mar 2020 19:17:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 65DCCC1D7C;
	Fri, 27 Mar 2020 19:17:03 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D88BCC0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 27 Mar 2020 19:17:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id BE389886FD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 27 Mar 2020 19:17:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FRrDwGtl0ohw
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 27 Mar 2020 19:17:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 65221886FA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 27 Mar 2020 19:17:00 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id l25so12069642qki.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 27 Mar 2020 12:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language;
 bh=An011IuxKqr4K52vHg7C+Gj7D+SUTbrzyKJ+oxWoM2o=;
 b=OH4DvcSrG7nljqCiy1DiF9Echt+BZ4b7HAHwgZ9eR65Q3UH98M68xzt9f5SPiNiQx7
 Z7Rmim3dqoaxXM2a+Wd1IC5/AWx6Njdw0FUcp+XA7JE8YC+d569AvhGlazuqCyER16JY
 74BypznGH7Zn/OS6gAWYv0PfinNTSZTZu28sbj2pec0f7fySm+7uIKZR8y84etuKDPcv
 MXQ6PeHHxKZ0LSYsPwRasQtTIiYbriW1T6HUJqy3o5G68CYY5zJmRubLU1u+Xqa8Mnuv
 WjfPYoSqRnWkNBFMEf3065xX88yqgjr+KHuMoezrzI0a/jGR5FUyGeAiHCFGecan+64o
 1hOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language;
 bh=An011IuxKqr4K52vHg7C+Gj7D+SUTbrzyKJ+oxWoM2o=;
 b=WhtDpvvM2xHDDzDq7X9C+300OuIwW5htL4tGhN5PVNyXI1l6hj4lpD+hZCygvn8R75
 P/JyswuqatPaekKvosRh+g61ExkMcS65WlXiLZ6KqdKwypis249Lp/9tKd6dmubxX1eA
 x/nzakDo9dShDpStOTU46ron/XBitd15LFosRKIYqXxx6PB2zvppU1LLZeYQbK1o4aTX
 HoQ2i7HBjun9fxU4zrB26JmoywPR/GK9E9ceCOWK6swITe9IFkomHRo2WaM/pTW3kQmf
 wtxbjMw0pZ/mHduUGT6WjWPVMmzGBF696LVcOwd1pzHnk2S+ZCttM3aJIUQerW9Qg3xy
 rpEg==
X-Gm-Message-State: ANhLgQ1AMy1ENpo2En9NI6+hQbQLHygK7Lc93cVJoI0RaMAnS9WxlQTw
 TBM6VxrGVwcELwaWA7dkQtodHwq7
X-Google-Smtp-Source: ADFU+vunX1gRaaFeLJVgUMbQC8+UYcskH2BmxE8uMFDvPbAg3uQGPBQeJinCm81YGV7pN/r8ATu4cw==
X-Received: by 2002:a37:6455:: with SMTP id y82mr913551qkb.286.1585336618961; 
 Fri, 27 Mar 2020 12:16:58 -0700 (PDT)
Received: from ?IPv6:2804:14d:72b1:8920:a2ce:f815:f14d:bfac?
 ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
 by smtp.gmail.com with ESMTPSA id 85sm4307810qke.128.2020.03.27.12.16.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Mar 2020 12:16:58 -0700 (PDT)
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
References: <20200323125732.281976-1-dwlsalmeida@gmail.com>
 <20200323125732.281976-4-dwlsalmeida@gmail.com>
 <20200327174740.5d5935ae@coco.lan>
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Message-ID: <a4066f72-ae83-c1ef-8bf7-d4bbcfa29b31@gmail.com>
Date: Fri, 27 Mar 2020 16:16:50 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200327174740.5d5935ae@coco.lan>
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
Content-Type: multipart/mixed; boundary="===============2515832902823073201=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

This is a multi-part message in MIME format.
--===============2515832902823073201==
Content-Type: multipart/alternative;
 boundary="------------5881F56EFBCE801B7772EB35"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------5881F56EFBCE801B7772EB35
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

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
>     interupted;
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
> past the buffer size, you should check*before*  the bad condition happens,
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



--------------5881F56EFBCE801B7772EB35
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi Mauro, as always, thank you for reviewing my code!</p>
    <p><br>
    </p>
    <p>Sorry for making you repeat yourself on the alignment of
      arguments and on multi-line comment syntax, I am aware of these
      and I thought I had fixed them all, but some just slip by
      sometimes.</p>
    <p><br>
    </p>
    <p>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">As we talked via IRC in priv, the best would be to implement the MPEG_TS
generator as part of the bridge DVB driver.

Anyway, I will review the code below assuming that you'll be moving the
implementation to the right place.
</pre>
      </blockquote>
    </p>
    <p>Yes. Please let me know when the changes in
      experimental/media-kconfig land, since I'd like to rename and move
      all the code - including the bridge I have been working on - to
      test_drivers/vidtv. <br>
    </p>
    <p><br>
    </p>
    <p>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+static void dvb_dummy_fe_thread_mpeg_ts_tick(struct dvb_frontend *fe)
+{
+	struct dvb_dummy_fe_state *state = fe-&gt;demodulator_priv;
+	const unsigned int SLEEP_MSECS = 10;
+	u32 ticks = 0;
+	u32 i;
+	char *buf = kzalloc(DMX_BUF_LEN, GFP_KERNEL);
+	u32 buffer_offset;
+
+	struct dvb_dummy_table_pat pat = {0};
+	struct dvb_dummy_table_sdt sdt = {0};
</pre>
        <pre class="moz-quote-pre" wrap="">I guess it is ok here, but allocating too much stuff at the stack is
dangerous. Linux Kernel stack is very small. Perhaps the best would
be to place those at the driver's private struct (with is allocated with
kalloc).

</pre>
      </blockquote>
    </p>
    <p>Well, I wasn't aware of that, but most of the data for these
      tables are heap-allocated. How small are we talking about? <br>
    </p>
    <p>But your suggestion is OK with me as well. It would be even
      better if this entire function wasn't in this patch at all, since
      it will have to be moved to the bridge driver anyways.</p>
    <p>The *_write_args structures are also pretty small.</p>
    <p>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">+
+	struct dvb_dummy_table_pmt *pmt_sections;
+
+	struct dvb_dummy_table_pat_program *programs = NULL;
+	struct dvb_dummy_table_sdt_service *services = NULL;
+
+	bool update_version_num = false;
+	u16 pmt_pid;
+
+	programs = dummy_fe_pat_prog_cat_into_new(state-&gt;channels);
+	services = dummy_fe_sdt_serv_cat_into_new(state-&gt;channels);
+
+	/* assemble all programs and assign to PAT */
+	dummy_fe_pat_program_assign(&amp;pat, programs);
+
+	/* assemble all services and assign to SDT */
+	dummy_fe_sdt_service_assign(&amp;sdt, services);
+
+	/* a section for each program_id */
+	pmt_sections = kcalloc(pat.programs,
+			       sizeof(struct dvb_dummy_table_pmt),
+			       GFP_KERNEL);
+
+	dummy_fe_pmt_create_section_for_each_pat_entry(&amp;pat,
+						       pmt_sections);
+
+	dummy_fe_pmt_stream_match_with_sections(state-&gt;channels,
+						pmt_sections,
+						pat.programs);
+
+	dummy_fe_pat_table_init(&amp;pat,
+				update_version_num,
+				TRANSPORT_STREAM_ID);
+
+	dummy_fe_sdt_table_init(&amp;sdt,
+				update_version_num,
+				TRANSPORT_STREAM_ID);
+	while (true) {
+		memset(buf, 0, DMX_BUF_LEN);
+		buffer_offset = 0;
+
+		if ((ticks % 50) == 0) {
+			/* push PSI packets into the buffer */
+
+			buffer_offset +=
+				dummy_fe_pat_write_into(buf,
+							buffer_offset,
+							&amp;pat);
+			for (i = 0; i &lt; pat.programs; ++i) {
+				pmt_pid =
+				dummy_fe_pmt_get_pid(&amp;pmt_sections[i],
+						     &amp;pat);
+
+				/* not found */
+				WARN_ON(pmt_pid &gt; LAST_VALID_TS_PID);
+
+				/* write each section into buffer */
+				buffer_offset +=
+				dummy_fe_pmt_write_into(buf,
+							buffer_offset,
+							&amp;pmt_sections[i],
+							pmt_pid);
+			}
+
+			buffer_offset +=
+				dummy_fe_sdt_write_into(buf,
+							buffer_offset,
+							&amp;sdt);
+
+			WARN_ON(buffer_offset &gt; DMX_BUF_LEN); /* overflow */
</pre>
        </blockquote>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">+			msleep_interruptible(SLEEP_MSECS);
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">That doesn't sound right, for two reasons:

1) msleep_interruptible() can take less time than expected, if
   interupted;
2) the time may vary a lot.

I would use the high-res timer here, giving a range for it (maybe a 10ms
range?), e. g., something like:

			usleep_range(SLEEP_USECS, SLEEP_USECS + 10000);



</pre>
      </blockquote>
      OK. I wonder if this will have to be rewritten in the future,
      since decoders will probably expect X amount of video/audio per Y
      amount of time?</p>
    <p><br>
    </p>
    <p>As for buffer overflows, maybe a better strategy would be to use
      a dynamic array? I would wrap all memcpy() calls and call
      krealloc() as necessary. If we go with a big enough initial size
      (say, 20 TS packets) then this wouldn't happen very often, if at
      all. That would be a simple solution to completely eliminate this
      problem, in my opinion.</p>
    <p><br>
    </p>
    <p>I don't know if there's a limit on how much data you can pass to
      the demux at once, but if there is, we can just split the buffer
      into smaller chunks when calling dmx_swfilter_packets(), since the
      amount of bytes actually present in the buffer will be a multiple
      of 188 anyways.<br>
    </p>
    <p><br>
    </p>
    <p>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+	}
+
+	length += CRC_SIZE_IN_BYTES;
+
+	WARN_ON(length &gt; SDT_MAX_SECTION_LEN);
</pre>
        <pre class="moz-quote-pre" wrap="">even assuming that you fix the above code, and update "s" to the next
SDT data, this is still too dangerous: if are there any risk of going 
past the buffer size, you should check <b class="moz-txt-star"><span class="moz-txt-tag">*</span>before<span class="moz-txt-tag">*</span></b> the bad condition happens,
e. g., something like:

	while (s &amp;&amp; length + CRC_SIZE_IN_BYTES &lt; SDT_MAX_SECTION_LEN) {
		...
	}

	if (s)
		WARN_ON(length &gt; SDT_MAX_SECTION_LEN);

</pre>
        <blockquote type="cite" style="color: #000000;">
          <pre class="moz-quote-pre" wrap="">+	return length;
+}
+</pre>
        </blockquote>
      </blockquote>
      <br>
    </p>
    <p>My understanding is that, e.g. <br>
    </p>
    <pre class="moz-quote-pre" wrap="">length &gt; SDT_MAX_SECTION_LEN</pre>
    <p>doesn't mean that the buffer will necessarily overflow. It is
      just against the spec.<br>
    </p>
    <p><br>
    </p>
    <p>Best regards</p>
    <p>- Daniel.<br>
    </p>
    <br>
  </body>
</html>

--------------5881F56EFBCE801B7772EB35--

--===============2515832902823073201==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============2515832902823073201==--
