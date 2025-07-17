Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B7E2F7D0A
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 17 Jul 2025 14:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752762617; cv=none; b=m+nJH3rMt2mKZyFXAhBS6/gMuoPh1fnYtIxMfjBrQgtt6xXUv1Pf57qDuWsZph7XAkC2lz82V8qbnEzEivfiVemZ2XJk/pwBseeOrO31G76w8Q7LQczICINqgoRsEJuoSDzQ1Iqz9RN85JgDq3KY4yppYGsmB41cKQpzbMt7Kdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752762617; c=relaxed/simple;
	bh=i4AOCu/t+teVCBfAnuyDW57wdR/g54HBsrTynSNwcfg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e09PweGnnZ5Fdo2DlMlmQO5AqVvr9dsxT52Z1hBmdsV95xahWWnTexBgCRRCVsFOppAAzgqIKEayG25gbtJ0dX4J4TDKx5kh/ShsGye3Z6FmQJNiGNvNGfcEWO9nwFYsbNscetjQmao1F1b5EyqQp0/lJJryu1xglhfnwW6DcHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zOxfmT4e; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zOxfmT4e"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-72c27166ab3so786949a34.1
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 17 Jul 2025 07:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752762615; x=1753367415; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c9WyUNURTxDjhSFlDNytarMEzB5jWv8rhBlf3egCP8I=;
        b=zOxfmT4e5MujK5231cupkcqMGFTyZlcbvfLr9wpROUOKdiSexKfS42073cBWVskycZ
         +e7cCAsLYaA6CFU5APYAYo8AWbKFyD/RkyApVKpu9UP3GdkiP1/K1NZWtmwQ0iTRsobj
         U/Fc5CJihVMoCjaNNUXsDBysXE0XWbNXMgAmOrqJxOUj4Bx+Pgryh+LUrCh11uIAsVGH
         JRRK5d96SHjYp6a+AUnvJs9G2iwAj8DODTQS1fiwzWvw9ho5BD8Q8ign91HQKLkF/1HA
         9fe+ABU0F4XCbP3FG4wsx2XPPCh+xPo71ig66DvPZmWtBfeV4y0a1zr1dwE6aVMyNBZP
         8GOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752762615; x=1753367415;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c9WyUNURTxDjhSFlDNytarMEzB5jWv8rhBlf3egCP8I=;
        b=H1M6x/MC/b+7m7c4hHLEHOBBgLKIgpi/W9pktLz/4EorK5fKvaZH+0H/4alOxxAW94
         vVErfBUtk0q/LZhJNibqJXCrLbbO1SD+0rB60kuojkl9awdq3MvfTiQDI6Fx1UwYNGBU
         x6Wvht+9DY4Ma0brhsuWUUcVLNMH2m1Oa6t5kG+3wPEhPZ9OwHiH/SLf2vAx8OTGGECr
         ebUj1t9OG4F3YGxYkSpq0Weuq3z5vRA+Cf3queknY8SadWuoL7vDjYH0uV3hdd3vBsnY
         SrPdhgIdQffaSm+KJShtHDTwsjp02znbS7jnjWG3e75R3M8asJEJN8OcJm0kJ6/o0XhI
         3vSA==
X-Forwarded-Encrypted: i=1; AJvYcCXS+d67K9/WwTDkSQmoHOIhb3GtTyy2RHJH11jRoEgsLkC8KAP1uyMGbBb2TSftPM4xWV7et7Gw9E8GeqAH/FJjjz2xRA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzcZDXNuZhLR4vN2zYhG2EWAJJ0mBpfrBwLB7B18Lm/UWPdQ2Ur
	bLSh8Vhuf469Mux0x7BRXgpX55hFOzg61rjV2Fvf/vVDJhSmVfdpGYGhpnnXLuZ1KXk=
X-Gm-Gg: ASbGncuysisP6L4+FttUnwBlvW8Rdxol1YaZDbAtSWiYFCUh62vpnNK1ekoXD1jrr9V
	k3oIR2hznSMNK96FLvmaZDv2YATaW1n0EIbJL9qWtwpUhwLXqFujfOAVf1yUgoaN3p/NIHgxb4e
	bNH72E+pmXuR6h6nFcSlTzysTVQxDheeXcYC5VGgwcK1Hqe8OQfod23BCy0VUBzqUlWgW8VTlIF
	skeX6rcSkj9lXSxxbz6FSr6RaIhiOzUsSwvTSVI+ODnnw/+cUiTQbOWFFboupgWiFEJrbkmfkYZ
	e7SgTXzeCzv6YVBqCNc8gdHdJuKTLaowuIzJkiA70h77a2W7ocCWWLuy0FNXUayXm7fgx3knHpX
	5iPQslOGJp7pesGWr3888I1DDD4d/
X-Google-Smtp-Source: AGHT+IHk7/gc9YLubk1Cjji23IU9exbggTb4A51g9DQ8a5fEshA2ox0UCblR1EaUtTw1t+IxEkNNCw==
X-Received: by 2002:a05:6830:2113:b0:73e:6bd0:ff93 with SMTP id 46e09a7af769-73e6bd14111mr4602096a34.12.1752762610529;
        Thu, 17 Jul 2025 07:30:10 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:2c38:70d4:43e:b901])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73e5d9028c4sm2024909a34.59.2025.07.17.07.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 07:30:09 -0700 (PDT)
Date: Thu, 17 Jul 2025 17:30:08 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com,
	andy@kernel.org, gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org
Subject: Re: [PATCH v3] staging: media: atomisp: add missing mutex lock in
 atomisp_s_fmt_cap
Message-ID: <3b926b78-b95c-440d-846d-bc9d95aee714@suswa.mountain>
References: <20250717124234.24572-1-abdelrahmanfekry375@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250717124234.24572-1-abdelrahmanfekry375@gmail.com>

On Thu, Jul 17, 2025 at 03:42:34PM +0300, Abdelrahman Fekry wrote:
> The function atomisp_set_fmt() modifies shared device state and expects
> callers to hold the isp->mutex for synchronization. While most internal
> callers correctly lock the mutex before invoking atomisp_set_fmt(), the
> V4L2 ioctl handler atomisp_s_fmt_cap() does not.
> 
> This results in an unsafe execution path for VIDIOC_S_FMT ioctls
> (e.g. via v4l2-ctl), where shared structures such as pipe->pix and
> pipe->frame_info may be modified concurrently without proper protection.
> 
> - Fix this by explicitly locking isp->mutex in atomisp_s_fmt_cap().
> 
> Fixes: 4bdab80981ca ("media: atomisp: Make it possible to call atomisp_set_fmt() without a file handle")
> Signed-off-by: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
> ---

Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

