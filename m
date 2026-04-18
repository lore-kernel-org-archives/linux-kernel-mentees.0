Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33F493314C2
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 18 Apr 2026 11:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776512658; cv=none; b=ppdRJ8hTW2PPbbTNI0YfQicFdrPcQYQpzHzeho5bjbEN/eA1BhwHECoUSL5J3r4ecS0iEU8ghWZcLJDcN7VYXNfauVnr436/wYPlUS4OPG3iBNDMveSFqrKCZswOE6kyRbdk+Q7CoG9urQukurjEKKCRlELgdMinnRTBW8J9vYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776512658; c=relaxed/simple;
	bh=DTtC8NxB4D5X346ZQ8nuFBJ4c5G4OQ30co4kBHhXhtM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p62GkzRWZWYauW8swcHgVG0yx7utaz1339AMQpZATf9OuR9C8FIAX0edMJi6XSiNoQfr+cOkJy0d+bVbmMDatc0UtJGioelERj1UchMzpXCZCOwBXrPao4sCgwiLQ70kbR8I3wNYl/iJn7Wh1ruQN74j7P4L8NmWmL6s2oZBHAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P8JAj7A4; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P8JAj7A4"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-488b8efed61so15444665e9.1
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 18 Apr 2026 04:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776512656; x=1777117456; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iIJ+Ah9Hw1cuV39d17Fs4Sjoe/KtvVS8yFzsHhldbSk=;
        b=P8JAj7A4w17VnIFF8nIIJpyVHIchUPszKvHKd+UIuMUiI+by4IKd0w8sF1V74E8UnI
         7EFqmaawoHyRI3eI9yQkWmi66XpNqO0trIlA8NDj+3yeEJ+AYN/+9JKUxv7x+yXZtyii
         yKTlULM+zYIHEkxxPC6etkXg8iIBYO+eQfnCE/IL0ML6vezke24jYqy/W1bflLrPcOIk
         1WP6aACmpiBvX9r0J+dPk0iZXDA6R17F6aVH92K8rT8Nf5VyVyFqS+BULmPwfOCRMc0M
         sK5XFQhhXJGJcMeyWogmABQDK4R8zYmnR1HYJ6maOXa1o+PaWnOABi4lknN6QcD05NGJ
         CPxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776512656; x=1777117456;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iIJ+Ah9Hw1cuV39d17Fs4Sjoe/KtvVS8yFzsHhldbSk=;
        b=hQOulk86FgJ4s2k1GBICGLBqB6wSL3qxXjbv+O8oXHhRFcE6/VIuP/gqEJSmTzPZi3
         XR3Nj1zt5qScICmX04ZY1xogcdvdeZigz1YMXRIA1wtk0VCDJqP1tiefvXNd1/zOx3eF
         IGSobVNuqrRc/NmPbPMpFNsRdWyn4/j+J96K+HeYR09NXl3hHtmL+0S2LaGtdnHq1l2n
         WiM00j+nROzmSr6FS1KqHhinPcY3mpm87v0sMXXWJ/RkS+f2kinZG/4Zml2HsrZKCi0T
         hE1PHHhraMtiXRH9MLKx85MvuUN4EWwOX3mW/ECKPvS1Hr4SK5Xe06A7cDEeqyuyxFuV
         zLKw==
X-Forwarded-Encrypted: i=1; AFNElJ/VNVktCp6xC63HDH7/UJxHMBHgRYdgVAdMILTBMuTqoboTO5TGzyfVAnVxMXI6+SbbkHEppyiQPxlX/JfmFB2fxaSrgw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzhWE93q0guixP7icwlXCGVRSLCYVKGLzherBQdMN5rQmMJC1jD
	g0SXGQi++Q4eDKhyo6cpFWCo+Aq853JHhRRO9V2STLPaysv+LAC3pIS6
X-Gm-Gg: AeBDieusT5FSCi5s1AtrpvXgNLf0msaf4djD060PV8Alqgrqt1siVLe5U1xoXBrxiUW
	OAZouZFJmo7xu/PQK9TcQYCiZLU+JqtZl8Eyqa/M8so8N3EYqyHa2Hmk+PnHIXQx5b/AIjaWY3y
	Z3lnwNHHuQrIsyC4i4QyPikm+AKClNK9J94veryDyvA6ZQbKTBMKZ2n6ByLP4Xh+LV7hVbTnpwk
	a11+rRAOCmY1z+gm2X87TX/RL+5QOYDSwQHvFHXVpZ41m8X12bzL0lzEWSWSItCmSBxwPOb0SZN
	RxzoMwBxjcZNT4fbE8zuJstFQqi/YMCtvNiBFJ6FtsdXEs4znXA6Ax4trRDqY0MYZGimgb3Gq3t
	A3Qv1TjLdDOpWLL39efnsft+7rb/FV1TRbodHn50w4rQIHop3TjEklRWC/YjfFeN5EusECPsAn2
	Zwsf/ZOyvWWPG5HJ0L2c6t8Igs32Q8aQ==
X-Received: by 2002:a05:600c:c0d8:b0:485:fbd2:f72 with SMTP id 5b1f17b1804b1-488fb8838abmr61301985e9.1.1776512655419;
        Sat, 18 Apr 2026 04:44:15 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc1070bfsm120135555e9.7.2026.04.18.04.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2026 04:44:14 -0700 (PDT)
Date: Sat, 18 Apr 2026 14:44:11 +0300
From: Dan Carpenter <error27@gmail.com>
To: Manuel Ebner <manuelebner@mailbox.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel-mentees@lists.linux.dev,
	linux-newbie@vger.kernel.org
Subject: Re: [PATCH] Documentation: adopt new coding style of type-aware
 kmalloc-family
Message-ID: <aeNui4yhFtLnIvSI@stanley.mountain>
References: <20260418093101.130335-6-manuelebner@mailbox.org>
 <aeNcgSu8kVEyWbzY@stanley.mountain>
 <980be93ce680c831c37dbeeb070135b2fc8f4fb8.camel@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <980be93ce680c831c37dbeeb070135b2fc8f4fb8.camel@mailbox.org>

On Sat, Apr 18, 2026 at 12:45:19PM +0200, Manuel Ebner wrote:
> On Sat, 2026-04-18 at 13:27 +0300, Dan Carpenter wrote:
> > On Sat, Apr 18, 2026 at 11:30:48AM +0200, Manuel Ebner wrote:
> > > Would a patch like this one make sense?
> > > I think i need help with the change log. Is there something to much or missing?
> > > 
> > > ptr = kmalloc(sizeof(*ptr), gfp);
> > >  -> ptr = kmalloc_obj(*ptr, gfp);
> > > 
> > >  This one is done. The ones below are not done yet.
> > > 
> > > ptr = kmalloc(sizeof(struct some_obj_name), gfp);
> > >  -> ptr = kmalloc_obj(*ptr, gfp);
> > > ptr = kzalloc(sizeof(*ptr), gfp);
> > >  > ptr = kzalloc_obj(*ptr, gfp);
> > > ptr = kmalloc_array(count, sizeof(*ptr), gfp);
> > >  -> ptr = kmalloc_objs(*ptr, count, gfp);
> > > ptr = kcalloc(count, sizeof(*ptr), gfp);
> > >  -> ptr = kzalloc_objs(*ptr, count, gfp);
> > > 
> > > change log:
> > > [PATCH] Documentation: adopt new coding style of type-aware kmalloc-family
> > > 
> > > Update the documentation to reflect new type-aware kmalloc-family as
> > > suggested in commit 2932ba8d9c99 ("slab: Introduce kmalloc_obj() and family")
> > > 
> > > ptr = kmalloc(sizeof(*ptr), gfp);
> > >  -> ptr = kmalloc_obj(*ptr, gfp);
> > > 
> > > Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
> > 
> > Yeah.  Fix up the commit message and that could probably be merged
> > through the documentation tree. 
> 
> how do i fix the commit message?
>  what's even the issue?

I just meant that you should remove the stuff like "Would a patch like
this one make sense?"...

regards,
dan carpenter

