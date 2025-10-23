Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6A2333452
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 23 Oct 2025 15:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761231637; cv=none; b=fjm4pvnKzsz8w5GyQ0jy0eXeD6lxgnVnzeThfZVxv1Z46H8eeS+v3mJf8AhaKLjTTNvscefXJSHu/f/13xrT23krkZ6PnJhSkgBLlonQI2bzGXxBPUdSAU2QrQbEoKg0CTFrASn7mxaFP1Lx5UiPK1Z0ODaVdbQ/REjYqPz28VE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761231637; c=relaxed/simple;
	bh=EPTvx8s1xjF3tQm2xAcjvTwi2857pglx45RNhQja5kU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dRsys3gOwC8BAW/ddhNBeLZBHwKB/vVs+6TPwScLtUMHyqXlQRWdwUYjHBl+M+0Lc53xFKlL01MgiIGPrxj6BWUTi3YLwnj0/mJw91/RGdyuikgCepHy4SoBBKilun8Bl7hCEv+vM4i9/bg4BDAGdK+bKW9fEiyGlhlwMKdGreY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cQLT0hUR; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cQLT0hUR"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-33bc2178d6aso749585a91.0
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 23 Oct 2025 08:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761231635; x=1761836435; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EPTvx8s1xjF3tQm2xAcjvTwi2857pglx45RNhQja5kU=;
        b=cQLT0hURdq9JUiBWmGAGprbC5tw55dHd2gIAJr25A55T89fmSRLSOx5lzHA7915KEQ
         6pBviCZM8iUbGDbb48Fq2gF2Jrm020VDPOALy+exhM2xc5WhhdVxhsZ972Hjr4La8daM
         /ER28KXWHojDG/uaAQwziXfSxSju74Qf6fHK1pdrTEkliobcHDPFiP1s729qgI067r2g
         VOHfL0/ew7stE1MwJ81ctNcVphsNXsRPBfa7GbMh5Tx5xtIX0Ck1r6V0fE4Hz0jICKr3
         sbMoAgfU3Mf555jzifV0ZARo4Pz8xISkWDpoyw31F43to7NPDJxwnCsWbKi9WAkwTL/+
         zYpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761231635; x=1761836435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EPTvx8s1xjF3tQm2xAcjvTwi2857pglx45RNhQja5kU=;
        b=KEzPpZVw4hHjzUV+3p51ZgiVwu1HzkYkjuCOj0v5rXdlGM10njksGChcoB3KfY7tQp
         eteZ/pNk6SYb5JJqFPuJuBpqV6FNY1KvNXlreuG7FBSx47WCyg2Z+KQzLuvJW3OEouB3
         hXXcu0X/gH/5jBnQvrNT8TE/8qxxfQ8Gt0maAATanHx6DZSmEBHU9bAgVBq0vymFcbuf
         uCGiAPSdw+H8K8bWrSajP0f+CXwtl2aht+SOK8vhju2MvhoxKDDfp5oxJ02KUsmNBI+i
         tz/MuAbySG6Fdkcaphd9GCdxhBw3yPcI9EUp44uFqP0FEGDNhD1B2AIuP5KDglJuUxPN
         P5bw==
X-Forwarded-Encrypted: i=1; AJvYcCUcjg3iX1Sjek8/GIGKJQwKVUWk8O30yZxQ6iXTBveVnugDa1F/CHL7Jt9gsaEXXbIKcKVWJcrqWXi968+c6eR52THHpA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzRj/53+D4irDWro3P/KRG9XE0HVZW7927nE+3UgxcW1sZ8JXVI
	nRl8TK2QEZ+W/aafNVaWpvj8HHJdBE/y11WmE8wwsxWeBHDgXUPHLFBO
X-Gm-Gg: ASbGnct0l2mp8K5Jrus7qiX0A4VattXNx9k/BoFsaiaWex/uQxmaAoFi2YKi/31vG0l
	NVxOlrIC7T43bzaY/hwSzz5yHfeBG2IyEMQK3P3uQF5vVTWaH6OB6c9Um+SUQkvOBPtqR7hsVRt
	REY1QdIBdGN1FXysxVIeJNic0D+YRzcErl4Wh7p9TXxXKuyYu1rskAW0K50Wt8IRWWeYH8rfzJ5
	i4nJUHXOm3rBYd4EiRe4ggVq6muFWLanh7YRUVBfkLb2mZYxLdrUBTQd4vYxFlJBw4SgsDXKbDF
	ykn6gUb1x2tykZaQd6ELHe9+67kHofOakoVAk91GPUG+TMmEY26UXgYqWl4hPYOettoIwCh9dbD
	U9xHzEbhjT4IZGkbWt8zgmVGgyWhWmt2ZdASG5TpLUU7pkkAtLP8gvxaxf6smmlPhz+7wBdZFNX
	B+g9WpDOoGQKHpsHAtASKUcrcLVQTV
X-Google-Smtp-Source: AGHT+IHn4PZEKXYm1+7LvVn4UMOqVz90PtQ2psqXknB6QS8j2BPnoDTfZDXsRQz5Bj7sIQFcKZg0BQ==
X-Received: by 2002:a17:90b:2491:b0:33e:2d0f:4792 with SMTP id 98e67ed59e1d1-33e2d0f58cdmr5814814a91.28.1761231634351;
        Thu, 23 Oct 2025 08:00:34 -0700 (PDT)
Received: from rakuram-MSI.. ([2409:40f4:2040:16ed:f15f:ed0a:f0b7:34d2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33dff3704f6sm4373510a91.2.2025.10.23.08.00.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 08:00:34 -0700 (PDT)
From: Rakuram Eswaran <rakuram.e96@gmail.com>
To: u.kleine-koenig@baylibre.com
Cc: chenhuacai@kernel.org,
	dan.carpenter@linaro.org,
	david.hunter.linux@gmail.com,
	khalid@kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	lkp@intel.com,
	rakuram.e96@gmail.com,
	skhan@linuxfoundation.org,
	ulf.hansson@linaro.org,
	zhoubinbin@loongson.cn
Subject: Re: [PATCH v2] mmc: pxamci: Simplify pxamci_probe() error handling using devm APIs
Date: Thu, 23 Oct 2025 20:30:23 +0530
Message-ID: <20251023150025.167523-1-rakuram.e96@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: itxfh366j3yhshvp5abji6xussdk2fc7zrtvc3zzk27y5ouwpb@fvvxnpg3keu
References: <itxfh366j3yhshvp5abji6xussdk2fc7zrtvc3zzk27y5ouwpb@fvvxnpg3keus>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Thu, 23 Oct 2025 at 18:28, Uwe Kleine-König <u.kleine-koenig@baylibre.com> wrote:
>
> Hello Rakuram,
>
> On Thu, Oct 23, 2025 at 05:28:17PM +0530, Rakuram Eswaran wrote:
> > On Tue, 21 Oct 2025 at 14:01, Uwe Kleine-König <u.kleine-koenig@baylibre.com> wrote:
> > > Yes, I suggest to make restructuring .remote a separate patch. (But
> > > removing dma_release_channel belongs into the patch that introduces devm
> > > to allocate the dma channels.)
> >
> > I believe ".remote" is a typo and you're referring to the _remove() function.
> > Removing if(mmc) condition check from pxamci_remove() can be handled in a
> > separate cleanup patch, while removing redundant dma_release_channel()
> > will be included in v3.
> >
> > Is my above understanding correct?
>
> ack. remote vs. remove is one of my most-committed typos :-D
>

Understood, thank you for confirming.

I've just sent the v3 patch. You can find it here:
https://lore.kernel.org/linux-mmc/20251023145432.164696-1-rakuram.e96@gmail.com/T/#u

Best Regards,
Rakuram

