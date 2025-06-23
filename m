Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992BA253F08
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 23 Jun 2025 14:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750688222; cv=none; b=fe6vcl+Hnrwd08Ic5kkXKQpXC1VM6rXtYTxWp7xjiT+XhydZt8p/3s7zemsjJsed0/RzU+ttfclJIvgtzy8458gSnYBpAX7FgrV+VOTpLjx6gYNWenskw4HbMIrOJyeUxpRN7K4hHjlDF9taYumAOB+Qcbd9bakyrWEmGd+mNkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750688222; c=relaxed/simple;
	bh=4sigOS/urFG8brAKKfv6zzu5o31axp6lF2JzLxHf/DQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dXcW9v4WevKpbokeg/URDf8Dpw65YlegnwvzgHleeDPbniy2UMW5Bpu//edNk+ef5ZjAnMaeo40ipH1vEZIT88dxmKnen65iZx0fnqs2hffPrICpzCBivEq1bdCuPSeQK/oXv9fhU0fNnJarfesPhI/InnpGBYRB77Rn4SIvcz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lS9fI/+v; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lS9fI/+v"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7382ffcb373so2541482a34.0
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 23 Jun 2025 07:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750688220; x=1751293020; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Sw2KbHBZVpbmJppFl8KBxErcXGguWr7O6NCzbr+d6nk=;
        b=lS9fI/+vN2jqfFqwYpkdMlMmcJMBjVTKZfuQWRjJTYTkEO+pf5sL7DfsXdQCtrart/
         76yFEz/GJIZiwKyaiY7loC+MbXn0tU3K7Anoah6NICy4SmZMz92PgBJr1hwhClYe2BUs
         QCJkh/M3ikgk7abE6Q6xyMQzvO83DPSLAf6HN7Fdaj91KDgT6EiHXzMM5GJVmtlMtwi6
         MnBmruExs2ZhkfR4vbHOiHZHomhSHCUQiIzqfP3qpYUDOYa5PzWEQ085i0o1rpGzymYm
         TCW3eXWlwkPMt3FsDBdOhkSIVGdhZfgJmb2UTP7Ep5Y9aOt/DoRf1B5WNBw61vjV8Es5
         B6LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750688220; x=1751293020;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Sw2KbHBZVpbmJppFl8KBxErcXGguWr7O6NCzbr+d6nk=;
        b=tcZFz2a5fwfwC3DL7/G1tzaHgMQBXRae9Bs7hgegEVMr7/0506gC+Di4vcejYYtt/q
         Wvh7fJ52khyT3JZMVrky1+tnLf3HB4kl135GNBTnBIkkfcnhGiSNi3byK+caOGTBHEDK
         jfJfYzcYvAylZprR8fVtkxGLgwjBY2l9ep5dxW7rIDJnaB1CiXvprCnqkoe05ckid6+h
         0zC5ERTooNv22MumK0kxqGqO7M8pZiw1Z7vSyw91GVkpSjDz/dxi1u1v6r1Pfo2ujXx4
         6nvm/5sCBk/FoJuy6UVPlk8Qb6vzGkCm1LsXTylsS8jpnY7hf77e2MEjaTP3rMEAXttU
         NieQ==
X-Forwarded-Encrypted: i=1; AJvYcCVx+NmHdwWgwRWVgiQKLVoGUjR+JAnBxrWwdZCEWx0q1mzI3NHXWL92RHhRlLgnJtXnn14JcoMTB7S4c/IqYBUboSa7Zw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzyFr0FxXm8DvWNZQUyCKnpoAVcfi8poKalRgQvlcm5BQXxEF7U
	jic+5vQwUuqB4FNgDx+9RdYweAknYYIk7pGFJ8W13pPNzAwRoPYDPOOAwfVE19m7PIk=
X-Gm-Gg: ASbGncvd4tWCCs5AQs75IjWY3K0WVdIJb6sP5fdg8PYLjjCyJwxsRxzG1suFFjq8xdf
	GEM/7EQdmEo2iTGo0+ahkx7axjd5mq0NpuZ5/hX8jqEhQjP3mnVdPkSEfZSSjFtWhoMtMLizsuD
	x4cZUTPKjRJDoXediCcUrxMJxcDQCXquChqt5X4pThPAGiCl8llas7hdYcGP2tCCZeFW31lH12J
	NGy+14kaBVMfWqWx40JzffCloL7U6nw77D6Npa8IrYMGIUmD9PZT4pkmhEYsPyMSAnkBV9CMk+m
	qPqUeKwnW9Z2CvOHIYt+I97EJKlLFcF/lggKKRIHnMpzdrz2h1GbiGjvP6RXNrPYuQbc3w==
X-Google-Smtp-Source: AGHT+IH/W6bUwoQ/oCDqxzbkBFhhtZ/Fi6LgoZ05YDqiaOhVb1dp7z4SKY54nEy+7+CedB7z2NIslw==
X-Received: by 2002:a05:6830:668b:b0:73a:96e5:19b9 with SMTP id 46e09a7af769-73a96e5a6ccmr8122051a34.2.1750688219746;
        Mon, 23 Jun 2025 07:16:59 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:8c3f:8b5f:5c74:76a9])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73a90cbb5ccsm1418904a34.58.2025.06.23.07.16.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 07:16:58 -0700 (PDT)
Date: Mon, 23 Jun 2025 17:16:57 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>, andy@kernel.org,
	hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] staging: media: atomisp: Replace scnprintf with
 sysfs_emit in bo_show
Message-ID: <a2a67998-f67e-4677-a348-780bf640bfc3@suswa.mountain>
References: <20250621062944.168386-1-abdelrahmanfekry375@gmail.com>
 <CAHp75Ve3PWgkwncVv5tGxzjWkF+Nodtp=Q3dpCejfSRD1BFMig@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75Ve3PWgkwncVv5tGxzjWkF+Nodtp=Q3dpCejfSRD1BFMig@mail.gmail.com>

On Sat, Jun 21, 2025 at 09:24:40PM +0300, Andy Shevchenko wrote:
> On Sat, Jun 21, 2025 at 9:30 AM Abdelrahman Fekry
> >
> > -       ret = scnprintf(buf, PAGE_SIZE, "type pgnr\n");
> > -       if (ret <= 0)
> > -               return 0;
> > -
> > -       index1 += ret;
> > +       offset += sysfs_emit(buf, "type pgnr\n");
> 
> This changes the behaviour in case the sysfs_emit() fails. Not that
> this is a big issue, but it should be pointed out somewhere.
> 
> ...

Neither scnprintf() nor sysfs_emit() can return negatives.

regards,
dan carpenter

