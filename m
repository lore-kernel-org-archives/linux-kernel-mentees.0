Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAD88CDB470
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 11 Oct 2023 18:04:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7EFC8403A5;
	Wed, 11 Oct 2023 18:04:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7EFC8403A5
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=RjNlA9aB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CDdqM4NJeyVx; Wed, 11 Oct 2023 18:04:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 63BD240160;
	Wed, 11 Oct 2023 18:04:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 63BD240160
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 42257C0039;
	Wed, 11 Oct 2023 18:04:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C11D4C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Oct 2023 18:04:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A8B7360D90
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Oct 2023 18:04:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A8B7360D90
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=RjNlA9aB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dS5_4F5BFiqf
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Oct 2023 18:04:16 +0000 (UTC)
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7FD4A60B00
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Oct 2023 18:04:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7FD4A60B00
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-690fa0eea3cso51819b3a.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Oct 2023 11:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697047456; x=1697652256;
 darn=lists.linuxfoundation.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=TVdVmZg52hW6WekTndMoeoclUBi/41WcYYuklZzQFhU=;
 b=RjNlA9aBThsX9d2FWq4EAfEAS4N81ob/TQMgE5398TOkh4a+EsVggSf7W8NcLapB5s
 XIVTq4+0lNSGnTsMNIuysBgNFgBzrk0+6F6mEXIhM5e0FHB+w+9MUXwBEAV8smLTpiat
 gjyiAtTooJi680k87MTwGvx16MfaIX6APskPuD85jkAMfR9OcHBPNcDbL7QG41aL5vVu
 ktmlKdAunvbEV97tkvj0CRtzEoGA9wdA1ug5EmzXUlAC+B+HuDGkcI79IW2rVVmxGwOf
 uNDdgNHL9pirdWQTo1aJaiK5sussKQ+/wJBb5n203SuZOpG4QPxEPgeh6Lv7/d2f7oJO
 mWPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697047456; x=1697652256;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TVdVmZg52hW6WekTndMoeoclUBi/41WcYYuklZzQFhU=;
 b=RmR52Mmf9ANyPF27gI5UsjxYWLroJshyfmMH1z2pXCoi9kcjIBAUHperOOkLiie8vz
 87eqV+n9VBPsPuZeE1TIjavflFYsqbvfEfXqAz4MK4dyzAV1EOT9ABqaewthEkNRq+J1
 wXqsGMU6dqe/mqyZRN57yvNvHNGRO2oUv3gb5xdEZfFBZWsCipVxxs0UQ2VXddZCSmYo
 KLEFsEx2VbZiBKH8+RQ0GANE3l5vYRWa8QOmWAuW5BO4EHZy9yY9BmBkKD6JA/4hdLmV
 Fjnu8kOE0qv2uJtEHotkdnmo5Vqf7Y5/saBruoDSxjpGp8nrfMjezvopF8efp5IEM4w6
 Dc5A==
X-Gm-Message-State: AOJu0Yw6ASbRv3ZU3EHQXe01vBt4iqw6OYHGeUBjtoawFx/Oo5y+RJ2S
 b22i4VHc2tTsCfEyS3f2fN4=
X-Google-Smtp-Source: AGHT+IFUwEJe+Lhn2xWyXnoyYJKi719/fpRhZ9eH5zF0QMBjBz4v72A47BUPEWkh1IFzw/EbsH2BlA==
X-Received: by 2002:a05:6a00:22ca:b0:690:454a:dc7b with SMTP id
 f10-20020a056a0022ca00b00690454adc7bmr24652307pfj.28.1697047455896; 
 Wed, 11 Oct 2023 11:04:15 -0700 (PDT)
Received: from atom0118 ([2405:201:c009:52e1:23ff:45f1:c6fe:e28c])
 by smtp.gmail.com with ESMTPSA id
 q15-20020a62ae0f000000b00690c4577101sm10726910pff.140.2023.10.11.11.04.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Oct 2023 11:04:15 -0700 (PDT)
Date: Wed, 11 Oct 2023 23:34:08 +0530
From: Atul Kumar Pant <atulpant.linux@gmail.com>
To: Masami Hiramatsu <mhiramat@kernel.org>
Subject: Re: [PATCH v1] samples: kprobes: Fixes a typo
Message-ID: <20231011180408.GB51067@atom0118>
References: <20230817170819.77857-1-atulpant.linux@gmail.com>
 <20230923173040.GA159038@atom0118>
 <20231007153900.GA20160@atom0118>
 <20231009095103.6d08e72a@gandalf.local.home>
 <20231010000356.1805c6e0f517245161ebdf03@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231010000356.1805c6e0f517245161ebdf03@kernel.org>
Cc: shuah@kernel.org, linux-kernel@vger.kernel.org,
 anil.s.keshavamurthy@intel.com, Steven Rostedt <rostedt@goodmis.org>,
 naveen.n.rao@linux.ibm.com, linux-kernel-mentees@lists.linuxfoundation.org,
 davem@davemloft.net, linux-trace-kernel@vger.kernel.org
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

On Tue, Oct 10, 2023 at 12:03:56AM +0900, Masami Hiramatsu wrote:
> On Mon, 9 Oct 2023 09:51:03 -0400
> Steven Rostedt <rostedt@goodmis.org> wrote:
> 
> > On Sat, 7 Oct 2023 21:09:00 +0530
> > Atul Kumar Pant <atulpant.linux@gmail.com> wrote:
> > 
> > > On Sat, Sep 23, 2023 at 11:00:46PM +0530, Atul Kumar Pant wrote:
> > > > On Thu, Aug 17, 2023 at 10:38:19PM +0530, Atul Kumar Pant wrote:  
> > > > > Fixes typo in a function name.
> > > > > 
> > > > > Signed-off-by: Atul Kumar Pant <atulpant.linux@gmail.com>
> > > > > ---
> > > > >  samples/kprobes/kretprobe_example.c | 2 +-
> > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > 
> > > > > diff --git a/samples/kprobes/kretprobe_example.c b/samples/kprobes/kretprobe_example.c
> > > > > index cbf16542d84e..ed79fd3d48fb 100644
> > > > > --- a/samples/kprobes/kretprobe_example.c
> > > > > +++ b/samples/kprobes/kretprobe_example.c
> > > > > @@ -35,7 +35,7 @@ struct my_data {
> > > > >  	ktime_t entry_stamp;
> > > > >  };
> > > > >  
> > > > > -/* Here we use the entry_hanlder to timestamp function entry */
> > > > > +/* Here we use the entry_handler to timestamp function entry */
> > > > >  static int entry_handler(struct kretprobe_instance *ri, struct pt_regs *regs)
> > > > >  {
> > > > >  	struct my_data *data;
> > > > > -- 
> > > > > 2.25.1
> > > > >   
> > > > 
> > > > 	Hi all, can someone provide comments on this change.  
> > > 
> > > 			Hi all, can someone please review this change. It has been not
> > > 			reviewed for quite some time.
> > 
> > That's because trivial typos in comments are considered very low priority,
> > and are usually only added (if they are ever added) if the maintainer has
> > extra time, which may not be for a while.
> 
> Anyway, let me pick this. I found this in my inbox now. :)

	Thank you. Sorry for the redundant emails for reviewing the change :)
> 
> Thank you,
> 
> > 
> > -- Steve
> 
> 
> -- 
> Masami Hiramatsu (Google) <mhiramat@kernel.org>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
