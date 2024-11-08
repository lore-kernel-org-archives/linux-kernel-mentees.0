Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8037464
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  8 Nov 2024 00:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731027139; cv=none; b=liUsdLEKeQmvLF03rrKQkoCnJ4t6Q8krkMq1dv7yzJ/ot8zWOKpmSD2Uji8eV28xTuwgdITxvCijwaowwjFbLlgWdHZjmBabP+UlXO7f+Yij6sd0Bax/cQZ710Pfnjg5OTZ8OE2/tIXwXiFb4dUV3DFZ8r7rWFdUz0VOdv38tbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731027139; c=relaxed/simple;
	bh=RvxY4a3WCb96CrFLRYIXYbqrR9Gkr0oINd/naqKrMBY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TAEH+u1NU2/zb5dAGQexOm7n5O3Uhk+JtBk+Uad1ofOswX0FhoCCEklcT8jqCIWUDtMuRGy1f8FPoSWNEdPDnEYuCw1H9FiftqiOjCZY6DKGwQRECkgtCMlJsqbNFr3Cf7Xj4GvFEqH7tLxtzkXVdBJznKkaE7lZbe3lsnhjwlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dmg1juo0; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dmg1juo0"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04504402DB
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  8 Nov 2024 00:52:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.25
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k4ecAHzACVUa for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  8 Nov 2024 00:52:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::52d; helo=mail-pg1-x52d.google.com; envelope-from=groeck7@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0B180402D9
Authentication-Results: smtp4.osuosl.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B180402D9
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Dmg1juo0
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 0B180402D9
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  8 Nov 2024 00:52:16 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-7ee11ff7210so1179585a12.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 07 Nov 2024 16:52:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731027136; x=1731631936; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/vmX3lXsTDc4GilAspkSHux0yJlii6bjqc6VWWGKkGY=;
        b=Dmg1juo0R610sP15DyodS3+P1PCVneuclSIhEr6qRfhW7BKIH4ORhcqkgJza3XbnoA
         EYS9+wEKtb2gEN6FMAhBmOwN6mTXHNxlgogq+Htg95t5VGFqvmEpZ1nw2p9/8BpX8Mwt
         LG5LrQeoVuNAQgtw5dxDyq0euboB3YBZiYvED50SN3Ur3qTzgRF7UCn5mO8yf5zWCPbx
         T+jstwZIciBIyLpSyXsObYOGyNOW1o19BzmhWVrxHGBg9zjk4CqSGhUvXMVmA5z7uKRt
         ZPrM3KUURbnfKyz1ZrBYZVFh7jAWgRoRSlfcLpSxPCrjutRkdsaoZMrEusv2HEzSKVtt
         fq1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731027136; x=1731631936;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/vmX3lXsTDc4GilAspkSHux0yJlii6bjqc6VWWGKkGY=;
        b=SleLEc7SdEDEmUqUy51j8GQyTw0ArnRk/IykVTCuKqfG+ArSXSQAeeLxASZzR4F8x9
         l+huS+lHEDzf4LXqTXe/7fW9/f9ovrUTzRUWDazoiDVMo43yaI17debxv0GuaJOMJKhS
         hkka+yaYQRQnzm6D4ID+dcsbwkx52wO3RFarHSiZHi1lrPMWUu6NtGCjqvSD1jot8GYz
         pTUhLgHyN499v2m0H2drS/AqO/uZtj0uC3a6NOqLGzjs8LkLueiKwG3YCDqvi4MO94iL
         1wDMNuH7Vo+xzcjW8UZLqkrN9TEopVTddR9m8CLTbUA/WLHPqh1h4tbJjdMP7DogkDA1
         51YA==
X-Gm-Message-State: AOJu0Yzbg+rXVv5u3Jq6V648wQvvoMH8m/FD/PLmhhDGLJUehR0wB7gD
	XAai7/Py3FKc4mg+q3P5MNowp6Njr38xAFYkZyMi0/hH/xpBAiU0
X-Google-Smtp-Source: AGHT+IHZukLAtGIpoxOU6vQP3kwwzNCueeorSKv/5xKNmHlTvDCD0P3IMlLzdm6raX4gDbGTWLEinw==
X-Received: by 2002:a05:6a20:7fa8:b0:1db:ec07:3436 with SMTP id adf61e73a8af0-1dc228930fcmr1458163637.9.1731027136133;
        Thu, 07 Nov 2024 16:52:16 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724079a403fsm2447659b3a.105.2024.11.07.16.52.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2024 16:52:15 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 7 Nov 2024 16:52:14 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Abhinav Saxena <xandfury@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
	Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH] hwmon: Documentation: Fix grammar in fan speed trip
 points explanation
Message-ID: <07b90400-7f6b-478d-80af-c7e71ac205de@roeck-us.net>
References: <20241107013849.47833-1-xandfury@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241107013849.47833-1-xandfury@gmail.com>

On Wed, Nov 06, 2024 at 06:38:49PM -0700, Abhinav Saxena wrote:
> Fix several grammatical issues in the fan speed trip points documentation:
> - Replace awkward "which % the fan should run at at" construction with
>  clearer "that specify the percentage at which"
> - Fix incorrect "is chip depended" to "are chip dependent" for correct
>  verb agreement and adjective form
> - Improve readability by reorganizing first sentence and separating the
>  complex explanation into simpler parts
> - Add hyphen before "see" to improve readability
> - Remove redundant "at" in temperature description
> 
> No functional changes, documentation only.
> 
> Signed-off-by: Abhinav Saxena <xandfury@gmail.com>

Applied, after fixing the subject (which needs to include the affected
driver).

Thanks,
Guenter
