Return-Path: <SRS0=DgfW=CU=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C1BFC433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 11 Sep 2020 13:56:51 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B9B1208FE
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 11 Sep 2020 13:56:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="wZUQKDaT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B9B1208FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id F24C4877ED;
	Fri, 11 Sep 2020 13:56:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id utQUd62FndCG; Fri, 11 Sep 2020 13:56:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6A488877C1;
	Fri, 11 Sep 2020 13:56:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6325BC0859;
	Fri, 11 Sep 2020 13:56:49 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4B920C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 11 Sep 2020 13:56:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 30E6B877ED
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 11 Sep 2020 13:56:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6fhzLSHveyyp
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 11 Sep 2020 13:56:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 9C9CE877C1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 11 Sep 2020 13:56:46 +0000 (UTC)
Received: from coco.lan (ip5f5ad5a5.dynamic.kabel-deutschland.de
 [95.90.213.165])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 815F8208E4;
 Fri, 11 Sep 2020 13:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599832606;
 bh=d7uhreoZCsV5cLjGa2m6T3OCKVaeVGxLp6Pj1OOBrEU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=wZUQKDaT+LuN0V89ejfn+fKnPxm4j5RiKnfJW3rUDdAfnQz3WjBIdOXXVH2JcxxzY
 1UOeL2RY8eRY0Foe/sUnaDcDTmeNss+egg1fiW6SZPaxWgNbXNsNwoczpVilxpwNfI
 2jtPLDrbT6/vpThC0XnF5huwhbaQ5HKgcYHzHBsA=
Date: Fri, 11 Sep 2020 15:56:40 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Message-ID: <20200911155640.79a15a14@coco.lan>
In-Reply-To: <20200911151046.076abb79@coco.lan>
References: <20200911100200.25214c37@coco.lan>
 <25F257A6-C651-4BE7-8482-14FCF121D88F@getmailspring.com>
 <20200911151046.076abb79@coco.lan>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Cc: "r.verdejo@samsung.com" <r.verdejo@samsung.com>,
	"nicolas@ndufresne.ca" <nicolas@ndufresne.ca>,
	"  <skhan@linuxfoundation.org>,  "@lists.linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation,
	"linux-media@vger.kernel.org\"          <linux-media@vger.kernel.org>,  "@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	"org\"" <linux-kernel-mentees@lists.linuxfoundation.org>,
	"linux-kernel@vger.kernel.org\" <linux-kernel@vger.kernel.org>"@osuosl.org
Subject: Re: [Linux-kernel-mentees] [v10 0/4] media: vidtv: Implement a
	virtual DVB driver
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

Em Fri, 11 Sep 2020 15:10:46 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> escreveu:

> Em Fri, 11 Sep 2020 09:18:20 -0300
> "Daniel W. S. Almeida" <dwlsalmeida@gmail.com> escreveu:

> > > 	3. dvbv5-zap wrote an empty audio file (without -P flag).
> > > 	   Probably there are still some issues at the program
> > > 	   channel descriptor or service;    
> > 
> > I don't remember whether I tried this. I tried dumping the stream to a
> > file with dvbzap, which should work. By the way, I guess we should be
> > comparing the output to this
> > 
> > $ ffmpeg -f lavfi -i sine=frequency=1000:duration=5 -ac 2 -c:a s302m
> > -strict -2 out.ts
> > 
> > Since it produces a playable transport stream file that actually sounds
> > like a sine tone.
> > 
> > Inspecting ffmpeg & vidtv output side by side in dvbinspector, you'll
> > see that they're mostly the same. I have a separate PID for the PCR and
> > some other minor differences.  
> 
> The problem is here:
> 
> 	$ dvbv5-zap -c dvb_channel.conf "S302m: Sine Wave PCM Audio" -t 30 -o pcm_audio.ts -P
> 	using demux 'dvb0.demux0'
> 	reading channels from file 'dvb_channel.conf'
> 	service has pid type 06:  273
> 
> See, it identified the EL type ID as type 6, which is handled by
> dvbv5 library here:
> 
> 		case 0x06: /* private data */
> 			/*
> 			* Those can be used by sub-titling, teletext and/or
> 			* DVB AC-3. So, need to seek for the AC-3 descriptors
> 			*/
> 			dvb_desc_find(struct dvb_desc_service, desc, stream, AC_3_descriptor)
> 				has_ac3 = 1;
> 
> 			dvb_desc_find(struct dvb_desc_service, desc, stream, enhanced_AC_3_descriptor)
> 				has_ac3 = 1;
> 
> 			if (has_ac3) {
> 				entry->audio_pid = realloc(entry->audio_pid,
> 							   sizeof(*entry->audio_pid) *
> 							   (audio_len + 1));
> 				entry->audio_pid[audio_len] = pid;
> 				audio_len++;
> 			} else {
> 				entry->other_el_pid = realloc(entry->other_el_pid,
> 							   sizeof(*entry->other_el_pid) *
> 							   (other_len + 1));
> 				entry->other_el_pid[other_len].type = stream->type;
> 				entry->other_el_pid[other_len].pid = pid;
> 				other_len++;
> 			}
> 			break;
> 
> Basically, it is not recognizing the stream as an audio PID, but
> as some other random data. Due to that, the output of
> dvb_channel.conf will be wrong.
> 
> As type 6 seems to be the correct one for SMPTE 302M, we need to fix
> dvbv5-tools (and likely other tools like kaffeine), in order to
> recognize it as audio as well.

Ok, I guess I got what should be done here. ETSI TS 102 154 says that
SMPTE 302M should use the "registration_descriptor".

From the specs, such descriptor should be filled with 
format_identifier = 0x42535344.

We need to add this on both at v4l-utils and at the vidtv driver.


Thanks,
Mauro
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
