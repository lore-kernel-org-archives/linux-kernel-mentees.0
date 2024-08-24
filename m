Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A033A1CD
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 24 Aug 2024 16:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724518799; cv=none; b=PGwam4KgGFI56fDlbTVOZjWz7gWcmO8dlvmUWhxjB6gNayppcMf47pN4Cug9uFcX9iYPuBiExB99Zbgevp9rTtq1fSE3M3um4SqzV2dP3WoHPrBXqe265+sCSk/cIV+wptfnh98pns+3iFlY0x7GDe1SIlBeYIea5YXGqvWqsvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724518799; c=relaxed/simple;
	bh=lXeQCgFqCwc9junnPX+UHRGX8JYyp8g9h937WdAwc4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ihoIslNhcfQ8vSq98RY6jpcC3P9ImrSL8/z4Rqz60V7GBq28VXJRIyZWuuJddyFqeaLirvxDLP2hc0Xvet73WZRP74M5TdY45BODlKjAzfiByIOpeX0hB9x+n6JgY4q5jjTYkTPuLLF6ajWRgeOsZ3Pp0TVxBuFN7OHyqWXNQgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S8MxBf6K; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S8MxBf6K"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 24E9B4033D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 24 Aug 2024 16:59:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pJ_FPva5FPSL for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 24 Aug 2024 16:59:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com; envelope-from=abhishektamboli9@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2B4884031C
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B4884031C
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=S8MxBf6K
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 2B4884031C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 24 Aug 2024 16:59:56 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-202146e9538so26278795ad.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 24 Aug 2024 09:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724518796; x=1725123596; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FuHiveji2iGcXAoGZFjQjnvmuv4HXmCovzfcy4zrYNw=;
        b=S8MxBf6K2dO6QsxEx+fcbeB3FHk0NnAn0vw4x7uoZFfzhdg6NqTgsvLAFZBN+Tp/Rw
         cOby3dwFDMFO3Opy7sYwLYgraeg0hHeYfg+3jExjOA2y5sVN/pkWU/myW3D+afvp8Sld
         9MZUeKAbRfBBquCCO2ik+eflxb4qJb3L+MRsZjQtrd8PZFaUh4/8ls/e5vdVIDOFJkro
         07oa8hfG19sH0LIPuV6K46tYw+8SB0qfNsCfls9S5K3ngXD41p7bgS6sajVr9Vx04Imp
         /07pgvU0tnm8v+ZjUPd0uagMSBzGxIaq2GV763tCXq0iRnsSip/MhEqCBuOXSlZbC0Ww
         u8OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724518796; x=1725123596;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FuHiveji2iGcXAoGZFjQjnvmuv4HXmCovzfcy4zrYNw=;
        b=OOMAh/MUzvPTsJYra/u1nIbA3bwI+UqlmUvT866filWUO9HrKJVjkVIqZH1I6wG67J
         XPrjAIIcX9+QG/7B/Bwkd5WSdUOOlI56LGzGxlxA7txMUVD/rhR+jIwUFDQfkqulpwDS
         nFDkcN8YDDbpchkDjdFDCHu6+hDktaCwHqqEhVtQOefJmsW/3sHasjbI6CwuvGesDl0n
         k0zDQaeiYYK+fWHLWRJSi9h8Ify6ucf8tEaWjdbnhsoVzXJZ7C1RAtOMKLbrR7ManEGT
         iujCWV45Uns/I+VW9mjxDDXiEDSQALTo45DzBVlZ52viKB4LmzwZFLfgryIUz01qESfR
         bd2w==
X-Forwarded-Encrypted: i=1; AJvYcCXtjQ/jyf/EXSQv3Wt6kuC8jLvkd4kJoHkBg/ae5jCsZyw8T0m5PfAFfXJEmbHNtJcnq4Jy9YpkrjE4Y5UCyXOnLAwurg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzQ+PQdtV6GfWyiMVJibpmbtkREFBO5QpbugZz4FPNcngKzLK40
	Ebo3MgANsejYQTc1WBcV5m5YinjS/nwA1Zsdf3yhFca083bSOGfK
X-Google-Smtp-Source: AGHT+IHvJPCSZ1L4NU2yIrRUj8XWrmqpuqmf6ZlTkB+V89y0EIDEkUyMOsWqefDwmDw/BaSZMb8nBA==
X-Received: by 2002:a17:903:22cd:b0:1fb:1b16:eb7b with SMTP id d9443c01a7336-2039e469e8amr70973515ad.16.1724518795941;
        Sat, 24 Aug 2024 09:59:55 -0700 (PDT)
Received: from embed-PC.myguest.virtualbox.org ([106.222.233.87])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20385bdc663sm44275575ad.273.2024.08.24.09.59.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Aug 2024 09:59:55 -0700 (PDT)
Date: Sat, 24 Aug 2024 22:29:49 +0530
From: Abhishek Tamboli <abhishektamboli9@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: tdavies@darkphysics.net, philipp.g.hortmann@gmail.com,
	garyrookard@fastmail.org, linux-staging@lists.linux.dev,
	skhan@linuxfoundation.org, rbmarliere@gmail.com,
	dan.carpenter@linaro.org, christophe.jaillet@wanadoo.fr,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8192e: Replace strcpy with strcat in
 rtl819x_translate_scan
Message-ID: <ZsoRhYeQb4A1yepl@embed-PC.myguest.virtualbox.org>
References: <20240823153411.74142-1-abhishektamboli9@gmail.com>
 <2024082430-unlatch-antennae-0ea7@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2024082430-unlatch-antennae-0ea7@gregkh>

On Sat, Aug 24, 2024 at 01:45:00PM +0800, Greg KH wrote:
> On Fri, Aug 23, 2024 at 09:04:11PM +0530, Abhishek Tamboli wrote:
> > Replace strcpy() with strcat() in rtl819x_translate_scan()
> > Also Fix proto_name[] buffer size issue to accommodate all
> > network modes.
> 
> When you say "also" in a changelog text, that's a huge hint that this
> should probably be split up into multiple changes.  Please do that here.
Sure, I'll do it.
> More comments below.
> 
> > Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>
> > ---
> > Changes in v2:
> > - Revert the use of strscpy and replaced it with strcat.
> > - Remove the 'pname' and replace it's usage with direct
> > operations on 'proto_name' buffer.
> > 
> >  drivers/staging/rtl8192e/rtllib_wx.c | 13 ++++++-------
> >  1 file changed, 6 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/staging/rtl8192e/rtllib_wx.c b/drivers/staging/rtl8192e/rtllib_wx.c
> > index fbd4ec824084..ec0c4c5bade7 100644
> > --- a/drivers/staging/rtl8192e/rtllib_wx.c
> > +++ b/drivers/staging/rtl8192e/rtllib_wx.c
> > @@ -23,14 +23,14 @@ static const char * const rtllib_modes[] = {
> >  };
> > 
> >  #define MAX_CUSTOM_LEN 64
> > +#define MAX_PROTO_NAME_LEN 10
> 
> Where did this "10" come from?  What sets this limit?  Why not 100?
> 1000?  2?  You get the idea :)
> 
yes, I got it.
> >  static inline char *rtl819x_translate_scan(struct rtllib_device *ieee,
> >  					   char *start, char *stop,
> >  					   struct rtllib_network *network,
> >  					   struct iw_request_info *info)
> >  {
> >  	char custom[MAX_CUSTOM_LEN];
> > -	char proto_name[6];
> > -	char *pname = proto_name;
> > +	char proto_name[MAX_PROTO_NAME_LEN];
> >  	char *p;
> >  	struct iw_event iwe;
> >  	int i, j;
> > @@ -59,13 +59,12 @@ static inline char *rtl819x_translate_scan(struct rtllib_device *ieee,
> >  	}
> >  	/* Add the protocol name */
> >  	iwe.cmd = SIOCGIWNAME;
> > +	/* Initialise proto_name as an empty string*/
> > +	memset(proto_name, '\0', sizeof(proto_name));
> >  	for (i = 0; i < ARRAY_SIZE(rtllib_modes); i++) {
> > -		if (network->mode & BIT(i)) {
> > -			strcpy(pname, rtllib_modes[i]);
> > -			pname += strlen(rtllib_modes[i]);
> > +		if (network->mode & BIT(i))
> > +			strcat(proto_name, rtllib_modes[i]);
> >  		}
> > -	}
> 
> I think the } placement is now incorrect, right?  Did you run checkpatch
> on this change?
Yes, I do run the checkpatch on this change and didn't get any warnings
or errors.

Thanks, for the feedback. I'll do the changes.

Regards,
Abhishek
