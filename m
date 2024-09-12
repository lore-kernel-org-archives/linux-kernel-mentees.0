Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72815383
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 12 Sep 2024 00:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726099959; cv=none; b=Tyh/+Y8YqWNVbylH9OqdmZ2D21QhMSay5ldl0ttAMU+4FZHffgkdCFRjLFC/6GA0cQmocFzauA2iT10P4wVHxRxS4UuPZTaz4RjlGBnGGeElH6jRIxIpyWNNQ4r9LZFoMaoCcAfvD8Uzw64OkQdZgAci7PGlu1qhOTN9qJqsHLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726099959; c=relaxed/simple;
	bh=yE1e1oJjZv8b19e6MheS1wRSUqmnO5tHYjKTQN6gSz4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gaZVujqlWJ9tjDCHXjDct684KEnlwLsyQWzf4Cc9iWqi8nt97ft+z+8RCkt6JJJnuNb8vsAWiycophj30UxYXNVD9Eu6+56z8t+mIIj0ljP2YO6UATTxl9h7fiaHIeEvNqTaOk6MEI+WYKhhrK6mLEBXIdu1O1TPAnOgyYi2ejg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lUcdhoVb; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lUcdhoVb"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1137E80E1E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 12 Sep 2024 00:12:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8mHjenhHzJvI for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Sep 2024 00:12:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com; envelope-from=abhishektamboli9@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 171A380E16
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 171A380E16
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lUcdhoVb
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 171A380E16
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 12 Sep 2024 00:12:36 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-718e9c8bd83so1083938b3a.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 11 Sep 2024 17:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726099956; x=1726704756; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YRhIRnidwJmOdSjyzFN3o9E8wDi15Yl61Z0LHp95sU4=;
        b=lUcdhoVby3w5JTG6X/GIIxy00lZ17eubEktu9UPq05pZM+n9rGrtVogegBtLYbBuBP
         hkF7TfZuZE5ebU/YMXrRyf7QRwxauhpyYba91oKntilX2qySE72njmtwG/ByctHmGAlA
         AQf2PQtC34SJeua4kZqebMlJ+YaPetqQJkdhw7RcFqgWlAtYQfMV5ZwwMKy7TyddqH1E
         A2gnxIUFwhHrxrxvSot4udXvcDQYp+9lSUNQg5gEssfiuPeWnph6agX1mg3/z4N3XyIU
         mmhH+C6DgZDI/ASpbNaqwGJxVYgXlLZSTQ2fpqax7TK+nx9y8zVPP9aRa4x3YxHP7U3Z
         CZaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726099956; x=1726704756;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YRhIRnidwJmOdSjyzFN3o9E8wDi15Yl61Z0LHp95sU4=;
        b=S20+ygXvouUyq4DhCkxGLMiG6M6MCeYk/o6bNq0A4/33jN6gOggEeyIQtBBQ49oRVs
         wcgTa6ZLcN/e9l9gmETkgoP7IfytCzC43tOFgYMUmCt5o/Q+7EkKZBdaHjrzveQg5QnH
         AhXHAKY3eoNPI8PC2ct1BjlEwASfjvhJnOcL1y1Dkep7x3LtD4EOiQflMOUUbGOXRKk6
         kesGn1XnXFdHE0XOZBRoAw5m0/DpUgyheTvNmZVSgcqU83vqdYs5RrwztMQ9xLqMdESg
         BWsn0J4NqAwWM7dEAT17vbn8uNedrQbx2ezKOkJYX0raK2Jqj6WuX3B5Gixm+8D9kNue
         1keA==
X-Forwarded-Encrypted: i=1; AJvYcCUc/hB9DaLA3wvxMj/jRuwbvjKumRVSM1i2D+mTuiYpTfFhGE4VnEhm44XJomT78JEPyyCXyfM4PqpCfze4O6tjByixSg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YySzZMdbDUSZLqj3ialRnrSr9b2TlYBpSP9XF3Wowr4xZMvYHGr
	OYn4mextRKqFLp3f+u3dAw1QQ0X+B9VShkBct5PQ2S1wVxU0XT0y
X-Google-Smtp-Source: AGHT+IFiWt724MUdfh6lTY2YBFQTHx49rEguXMGqwgXVrmwES84P38IbzbLYqPVXsGKTuLUxvXhVfg==
X-Received: by 2002:a05:6a20:d807:b0:1cf:6713:b791 with SMTP id adf61e73a8af0-1cf75598c1bmr1419212637.2.1726099956034;
        Wed, 11 Sep 2024 17:12:36 -0700 (PDT)
Received: from embed-PC.myguest.virtualbox.org ([106.222.234.231])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-719090c37efsm3512676b3a.187.2024.09.11.17.12.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 17:12:35 -0700 (PDT)
Date: Thu, 12 Sep 2024 05:42:29 +0530
From: Abhishek Tamboli <abhishektamboli9@gmail.com>
To: Doug Anderson <dianders@chromium.org>
Cc: neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
	daniel@ffwll.ch, quic_jesszhan@quicinc.com,
	skhan@linuxfoundation.org, rbmarliere@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	lkp@intel.com
Subject: Re: [PATCH v2] drm/panel: hx83112a: Transition to wrapped mipi_dsi
 functions
Message-ID: <ZuIx7dFxMa46dapr@embed-PC.myguest.virtualbox.org>
References: <20240903173130.41784-1-abhishektamboli9@gmail.com>
 <CAD=FV=VVxWBv2oqL39j8eoRdJf42byoiUJ+XvY0kwL-OXoe0fg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=VVxWBv2oqL39j8eoRdJf42byoiUJ+XvY0kwL-OXoe0fg@mail.gmail.com>

Hi Doug,
Thanks for the feedback.

On Tue, Sep 10, 2024 at 02:22:37PM -0700, Doug Anderson wrote:
> Hi,
> 
> On Tue, Sep 3, 2024 at 10:32 AM Abhishek Tamboli
> <abhishektamboli9@gmail.com> wrote:
> >
> > Transition to mipi_dsi_dcs_write_seq_multi() macros for initialization
> > sequences. The previous mipi_dsi_dcs_write_seq() macros were
> > non-intuitive and use other wrapped MIPI DSI functions in the
> > driver code to simplify the code pattern.
> >
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202409040049.2hf8jrZG-lkp@intel.com/
> 
> You'd only include the above two tags if the original problematic
> commit had actually landed. Since it didn't you leave them off and the
> Robot gets no credit (even though it is awesome).
Sure, I will keep this in mind before sending the next patch.
> 
> > Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>
> > ---
> > Changes in v2:
> > - Update the commit message to explain the reason for the change.
> > - Correct the code by changing 'dsi->mode_flags' to 'dsi_ctx.dsi->mode_flags'
> > This change addresses a build error in v1 reported by kernel test robot
> > caused by using an undeclared variable 'dsi'.
> > [v1] : https://lore.kernel.org/all/20240902170153.34512-1-abhishektamboli9@gmail.com/
> >
> >  drivers/gpu/drm/panel/panel-himax-hx83112a.c | 140 ++++++++-----------
> >  1 file changed, 60 insertions(+), 80 deletions(-)
> 
> Just adding a note that there's nearly the same patch in
> https://lore.kernel.org/r/20240904141521.554451-1-tejasvipin76@gmail.com
> and we're discussing what to do about it there.
> 
Regards,
Abhishek
