Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5251B23956C
	for <linux-kernel-mentees@lists.linux.dev>; Tue,  4 Mar 2025 19:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741115200; cv=none; b=gMfftI3H07axjr1rT0Fb5wr6kbMxPZ9JcklJ+iEJpZnuF7Ozhcs1EoN1CJO9Ck/aQMC47VBZBSjCJy1ri07pb47aWUSzzRehmoYJX2GVqYd8f4nSRd9dwf+zP+cVNfWHpYyKg3z0U2HDqQEUQDCeaYVfFvPo3ncxQEDDJLtLnaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741115200; c=relaxed/simple;
	bh=qgBjp+ydpJlBw52x0uUkgJn409XwUZVGlumTnsWJ3m0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CvvJj59b0UmDtx7W0zoAYMahjxJ4CGoCJPPCvudXmJmvRyo0678gh8v48Pm3HMg9pwk5pEx1Vj921vyq3YnAXCVGsbQp+Yt2sGpx3P0UhxyAX89e5v7M5ZMoPd7fQZuzeAoa6W7yiC6hfoEKcsQSRQd8b5RZHjQxJkIGRKS5omo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B0HMAOKV; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B0HMAOKV"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4750ab6a09bso1420191cf.0
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 04 Mar 2025 11:06:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741115198; x=1741719998; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tA27Lf3iJciKnB0JvEl1MO3LlYSglnQEOYlC6Hgx3eQ=;
        b=B0HMAOKVyUl5SQcNQl7VK1kk7/JfeRUuciLyfvmW/e4JxEaD3lzd7GAVelOZMIzAac
         jeIuUYKnVy8I2sXn2um66SJNh3+njLA0rbF4T4/cLMi8pSAly9Z0WyNwhe9DXor/Q4xw
         61eTmNSrgl0Y525qyXeUiF4LO58UHU23MvdrKdfctSrfb4sx7s+w93M3lMQIHDU82d1S
         vRLMe1XL7qmCqY3tSmFv1b8ocjEhczL0NxVWxmI2kx83TmQ+lrZds8ToNXQ1glaaqO/c
         CjAm/SQmYhvxxJTWgV0WnZeeONEMl8g5jVX0oZn246ENZcGmWrBEfEQiAOqWjRiBQeUn
         h13w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741115198; x=1741719998;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tA27Lf3iJciKnB0JvEl1MO3LlYSglnQEOYlC6Hgx3eQ=;
        b=DD9Fw9tfOSdKQui1twl6M8RGycxwoviFs+J3J+itttwMRu4eQ+tQrApSuTDvyoXWkd
         97TcKxkHgcPFOaoWQW7i4esMcQseneb+1RLn3/tiS4H3I+OqyLRN/zINDQJWjD/jSddZ
         841WFCOwVo8eIkKflF6zBGGIrcnam6+sUdgWVuIlSTqJdNrFPVKVOnU+/6avtPWbA9WE
         fYYEfV3a4akahoD4dDXxcbqLZasQNaNHJF4ANIHmOkjjfjS+3lbREA56hqxY9zKoMpUX
         DCsBmhNOA/hdoW+5CqLoazw6iB3Cgi1PTNXMQL4r6qoYBwF7FN4xPL/OEv9O7zO/Nuwo
         qZ/w==
X-Forwarded-Encrypted: i=1; AJvYcCXYI1OZ2hhAsTM7TIsJTZFP5wdOH301sbeR98bzoTJbU3N/xYXIKnKLbS5HZvYviwf+mT8mfPKHbOT0Xo+MTSrkpte/Jg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyAi+1juKxDmlQnaU/zgEe9CwohcVNPTaBWW/0bmsDYvP1zqz7d
	loOTnfslfzTzsFLlLC19c/D+WVYiFwyOcHkRvbpy6J3qCFH6bo6C
X-Gm-Gg: ASbGncvrdISN1nAz0OD0ayV0soNWBrMK9C6Zad6f4kweiCl/166ywJEANSyBWVTyWhL
	fRCaKmIhSjDlaUKiOh9LBbaa37/Qds+6ktw5RGmU/NuhRt1WAWAVpPKSUBtce0V3MH3RYvNmSUR
	PJ8wQ+gmnGQIFdyELd0oTPRVVHW2cOI1XjJmvoXwZIeav3mJVpC1ZDQb/OmPkN/lurgX4RnZPwW
	trdQmIEG/OqIpTM1N9ia/OHhfs9CUYPpSJfj77DDxAI8a5nhVCZJFUD+SkChlqcHaH4tkvAH6IQ
	w7ptH6TGFP/tw6dy7kBro1u13LMXCfsKsb/DTY4X45p+lcj68EvZk+cNmkPG6AAdz7W0mf+Mu2I
	Z
X-Google-Smtp-Source: AGHT+IEHMACm3UtM3g8IwgX8ccOiICa/jh1pmKFAIbjW7DNmAGnXI/0lrR7EO3ZtAv/HzcyoRr3unw==
X-Received: by 2002:a05:622a:198f:b0:472:13f8:a974 with SMTP id d75a77b69052e-4750b4c51d2mr2585531cf.41.1741115198077;
        Tue, 04 Mar 2025 11:06:38 -0800 (PST)
Received: from localhost (pat-199-212-65-16.resnet.yorku.ca. [199.212.65.16])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-4746b5eed4fsm76428501cf.31.2025.03.04.11.06.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 11:06:37 -0800 (PST)
Date: Tue, 4 Mar 2025 14:07:39 -0500
From: Seyediman Seyedarab <imandevel@gmail.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: jack@suse.cz, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] inotify: disallow watches on unsupported filesystems
Message-ID: <hg55e37tvfjnb76lvffuhnvozdwm4k6xuqq6nmvjgjaryjqmee@ppujm6t5y7ju>
References: <20250304080044.7623-1-ImanDevel@gmail.com>
 <CAOQ4uxiaY9cZFpj4m65SrAVXm7MqB2OFSfyH5D03hEwmdtiBVQ@mail.gmail.com>
 <5tq33ajgtu62tvaiymf3st74ctkurgskq6xpx2ax53vdbayoce@jffpxkthro3u>
 <CAOQ4uxiZfJYHrYmE2k0vWrgbLLbDQ2LTrVggYwL3pv4FUyjctQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOQ4uxiZfJYHrYmE2k0vWrgbLLbDQ2LTrVggYwL3pv4FUyjctQ@mail.gmail.com>

On 25/03/04 05:41PM, Amir Goldstein wrote:
> On Tue, Mar 4, 2025 at 5:05 PM Seyediman Seyedarab <imandevel@gmail.com> wrote:
> >
> > On 25/03/04 12:57PM, Amir Goldstein wrote:
> > > On Tue, Mar 4, 2025 at 8:59 AM Seyediman Seyedarab <imandevel@gmail.com> wrote:

> > I understand why it might seem like disallowing users from monitoring
> > these filesystems could break userspace in some way. BUT, programs
> > work incorrectly precisely because they do not receive any information
> > from the kernel, so in other words they are already broken. There is no
> > way for them to know if the fs is supported or not. I mean, even we are
> > not sure at the moment, then how would they know.
> 
> Programs not knowing is a problem that could be fixed with a new API
> or new init flag to fanotify/inotify.
> 
> Existing programs that would break due to this change is unacceptable.
> 

Maybe something like IN_DISALLOW_REMOTE could work for now, at least
until remote change notifications are properly implemented for those
specific filesystems? Later, if needed, it could evolve into a new API,
and the flag could become the default behavior when passed to that API.

> > As an example, 'Waybar' is a userspace program affected by this patch.
> > Since it relies on monitoring sysfs, it isn't working properly anyway.
> > This is also due to the issue mentioned earlier... inotify_add_watch()
> > returns without an error, so the developers haven't realized that
> > inotify isn't actually supported on sysfs. There are over five
> > discussions regarding this issue that you can find them here:
> > https://github.com/Alexays/Waybar/pull/3474
> >
> 
> You need to distinguish "inotify does not work"
> from "inotify does not notify on 'remote' changes"
> that is changes that happen on the network fs server or inside the
> kernel (in sysfs case) vs. changes that happen via vfs syscalls
> on the mounted fs, be it p9, cifs, sysfs.
> 
> There are several discussions about supporting "remote change"
> notifications for network filesystems - this is a more complex problem.
> 
> In any case, I believe performing operations on the mounted fs
> generated inotify events for all the fs that you listed and without
> a claim that nobody is using this facility we cannot regress this
> behavior without an opt-in from the application.

Understood. So this is what I should work on (correct me if anything
seems off):
1. Carefully list all filesystems where "remote" changes occur.
2. Introduce a flag like FS_DISALLOW_INOTIFY_REMOTE in fs_flags
   for these filesystems.
3. Provide an option for userspace, such as IN_DISALLOW_REMOTE,
   so applications can explicitly handle this behavior.
4. (Possibly later, if it makes sense) Introduce a new syscall where
   FS_DISALLOW_INOTIFY_REMOTE is the default behavior.

Regards,
Seyediman
