Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93050566A
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 24 Jun 2025 18:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750789891; cv=none; b=WKovZ/ZAqrJP5hHEuzinxRfPKIhMK83390w+ACXgjguKgBMXf06uuLfMSe+RZUZpV4fJTf0kgUGxEDuaZDKPg/lY5TJ+rS61n/c0grP1mm5LdyMBJXQDdotCdpIKFtT4U0HGqtf8LXAGdWuDdaPktknBsvjtB8WdMo5uBhlG8ZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750789891; c=relaxed/simple;
	bh=m8J3O7QzYtKHkTJW6LMTlN1rnZ3hXaZDwhHlnyjRWHQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BGvoAAlYCy7Lg+2cN5p+4ahVbIcRq2PxX13jkMQEmrxpfnkOkGm+Lc27fU9EG9LVaZVyldyqRgBgGxf7efy+ldAyl+Bj+otwEFcQkFmiyKHb/I8SuEijZ8rCXi7o/wklYxl1vldxs/lD0qa2gNLgSnOkjaT0NYqY/0tSbZbig0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UOp4j7JI; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UOp4j7JI"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-40a6692b75cso4431413b6e.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 24 Jun 2025 11:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750789889; x=1751394689; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GjxEYQ1lbJWp4ECKZKQpz8oozPbUNKZGlrJ6EmAWMmk=;
        b=UOp4j7JI8LzCbtrn9jCTGTcATuLOElhrzIov4mxAC5reVcKI0lJrMiQ2/caWCLAqBk
         JA2pEFT2nqRoO1kdDokBELzv1xZiJTLODZ/hfnTHeYmPcsTG9wQmag7jWGydwjwaHo9m
         sbFG/rHpSPwTbQ9SO+8dZths108rCIpu5UioFP4nFkvO40jnZUfjjrtHvNeuW7nBiXRj
         sqHI0tA62ySuvSsBTZ7XrOMv7q0JyeyYDRwsixKKfovEsy0X8NLxJ7FrSj4RNKMI4+Xx
         4M/65MmQr+QlI1tNVBWJlOZFrjI0pWYiq2dzZDqI9OqqBb0rlOP02IfmzK1TD4t0wUx6
         o85A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750789889; x=1751394689;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GjxEYQ1lbJWp4ECKZKQpz8oozPbUNKZGlrJ6EmAWMmk=;
        b=k8AjnRljphC+635v8yqSHVfl7ZRWlhBm1wMQbg87rgOu4SItMiR35qIuHPhGz5pxDQ
         nuvIASbuMxsysEdXXrPH4ywVd2mVlf0aglq/6UagDaZau3exLp2W1ZslUtcPerl+EsWs
         +ccyuhclCTWEePcORRWkk0ZF6ztpKbQQV/w8ghT2d27QKx2O38hJLcmEHdOqQ4hi6yqp
         bpsOt5PVqZOaKZtEWajfQryAJ/FNmz6h5MBUnA85dXh68Xk8FvF9nRo0ed5KfSVlJjRG
         0hJqsw/Bkl4iOvMhBjb90CWtfGNfydx4q4pw/IcjaGMndjJYVwHclgnBgtwtUHNz/4I+
         YO1g==
X-Forwarded-Encrypted: i=1; AJvYcCUOj7BKlKe3Y8xZJJiiuPZhYOkn2VZMnzZ9Att123r/W9XpCaaZQqB0rErOFFCRbL34Ajbd0JzfX4+h9DondeHf5x5zaQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzPhj482/JTCZXcHB2qMMkrRsWqURFJ3CkgpmO3TQ306Gtzmr7D
	zWk47hj4j6nfwburjDwHiB/+gIdjBRZ0HhvHet+MugagHI6K3E0WKSDJEovBcbtv7y8=
X-Gm-Gg: ASbGncvyKStK6vsKzLX2s4/uvvCoNZ/qGPbb5wlsDjivwJYNb7VAa6EzZMmsFRPT8Qy
	DfZ6196xeY15ZHwH3sOD4pThHWVsgxKc3oQQYzlzJdQi8t7M3nJ4y/Ma6rVCFst9a32URJsCEaF
	CtP+/ucG9Gcyhu9AuWWmcshyRAIVXssrr1jMSk8wKufQigAHw4lSCkIODIQyjrf/CP6SyK2uwxh
	/Sv+8srDjE1DndwjRQH6ab1yy198oIXyqeK1nassSZhBca/NmdM0246DAuqVZgD0L0Z8a8Xbc+3
	UgTb50zQFgmHV4RfD6ooXmGjskRyplZ4fEJKc0ecYqCHKspGZbS1kPurV19tjc3ehBHnaw==
X-Google-Smtp-Source: AGHT+IFwefbh7k0nvQhczietm5nprEfi0G1/PBzQxhLLmXWhfFEBYvdG9Ik5OraSPjQQOjmjLaMTJA==
X-Received: by 2002:a05:6808:d4e:b0:3f9:76d2:e437 with SMTP id 5614622812f47-40b05bf2641mr317669b6e.20.1750789888699;
        Tue, 24 Jun 2025 11:31:28 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:22c9:dcd3:f442:dd1d])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40ac6c30481sm1893573b6e.17.2025.06.24.11.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 11:31:28 -0700 (PDT)
Date: Tue, 24 Jun 2025 21:31:26 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Cc: andy@kernel.org, hdegoede@redhat.com, mchehab@kernel.org,
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH v2] staging: media: atomisp: remove debug sysfs
 attributes active_bo and free_bo
Message-ID: <5d579b8c-0676-46d8-a020-77ee91e1e7d3@suswa.mountain>
References: <20250624144943.39297-1-abdelrahmanfekry375@gmail.com>
 <cef03d37-715c-47a8-81d4-0872d505c39b@suswa.mountain>
 <CAGn2d8ML8eTcN2G18B7FYkapROnOeAKJir5fJvOXDdXTLY43aQ@mail.gmail.com>
 <5ce9dac3-0b7a-45d1-8313-2f65165b50e7@suswa.mountain>
 <CAGn2d8N8GrRR0FnaB7S2BsPs0HXHhwHfg+q55HbfkMqy1kMGTw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGn2d8N8GrRR0FnaB7S2BsPs0HXHhwHfg+q55HbfkMqy1kMGTw@mail.gmail.com>

On Tue, Jun 24, 2025 at 08:49:36PM +0300, Abdelrahman Fekry wrote:
> On Tue, Jun 24, 2025 at 8:32 PM Dan Carpenter <dan.carpenter@linaro.org> wrote:
> >
> > On Tue, Jun 24, 2025 at 07:51:10PM +0300, Abdelrahman Fekry wrote:
> > > On Tue, Jun 24, 2025 at 7:31 PM Dan Carpenter <dan.carpenter@linaro.org> wrote:
> > > >
> > > > On Tue, Jun 24, 2025 at 05:49:43PM +0300, Abdelrahman Fekry wrote:
> > > > >  int hmm_init(void)
> > > > >  {
> > > > >       int ret;
> > > > > @@ -130,14 +48,6 @@ int hmm_init(void)
> > > > >        */
> > > > >       dummy_ptr = hmm_alloc(1);
> > > > >
> > > > > -     if (!ret) {
> > > > > -             ret = sysfs_create_group(&atomisp_dev->kobj,
> > > > > -                                      atomisp_attribute_group);
> > > > > -             if (ret)
> > > > > -                     dev_err(atomisp_dev,
> > > > > -                             "%s Failed to create sysfs\n", __func__);
> > > > > -     }
> > > > > -
> > > > >       return ret;
> > > >
> > > >
> > > > It's really unclear how this "return ret;" is supposed to work.  Was
> > > > that part of the sysfs_create_group()?
> > > >
> > > yes , but still it can be set by hmm_bo_device_init so even after removing
> > > sysfs_create_group , ret value depends on another function.
> > >
> >
> > You're in too big of a hurry.  Wait for a day between resending patches.
> > I have looked at this some more and it turns out that nothing checks the
> > error code so the "return ret;" doesn't work.  What do you think we
> > should do?
> >
> sorry , will keep the time issue in mind.
> regarding the "return ret", its now basically returning the error code of
> hmm_bo_device_init () inside the function , but outside the function
> scope like you mentioned, no function call to the hmm_init() checks
> the error code. Thats what you mean right ?

Yes.  Nothing is checking for if hmm_init() fails.  Step through the
code and verify that nothing crashes or bad happens as a result.

For example, I think hmm_bo_alloc() will print "hmm_bo_device not inited
yet." and return.  So that's kind of annoying but it's not a crash.
Search through the rest of the driver and verify how it will behave.

regards,
dan carpenter
