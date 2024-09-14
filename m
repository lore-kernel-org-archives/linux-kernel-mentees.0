Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F166713AD03
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 14 Sep 2024 19:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726342592; cv=none; b=ENMygteax76VI4UOqsAhA5yBL2L3jYxp/1sWfEw/aUL8CrdbFciqqvwDkfK23cGiOlB9L1JyHWF6VYPKNwjC6kRuKzezfoHcoSUuR+nIkWQ+vrzIhfStqAf1Ip3xvmbSSuBg1Gk9VyZimhECficWHA37XnnZO3xnwshgo7EC+KU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726342592; c=relaxed/simple;
	bh=Aq0VPqO1An/naqvNFvCAB0TD+IiNrLVn9QDEvjABgao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l38H/ZjFwsi0ctjI0tR7DnEOIpnDiLc0Upcl2w7J5A3FsyUKu4yfa+t3gAjhIaBwjtrKxJL91y+lLqeBP8Lss0Ne9e32VIZn4D+OsM/Zx2lFne8Fmt9ThbPXU7Y71hNLS3KzHpWtgEt7tBqSxLDEUssrn5MpFlNqkg+q962RkR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TEBTfvaH; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TEBTfvaH"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1599E4072F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 14 Sep 2024 19:36:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SbNFbJpob06j for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 14 Sep 2024 19:36:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::72a; helo=mail-qk1-x72a.google.com; envelope-from=lanzano.alex@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 07C544072D
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07C544072D
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TEBTfvaH
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 07C544072D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 14 Sep 2024 19:36:28 +0000 (UTC)
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-7a9a3e731f9so282797085a.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 14 Sep 2024 12:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726342587; x=1726947387; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ALsTYKzgGgZbnVn1tjPr9vM2XSHNkmqY0xXK29XlQso=;
        b=TEBTfvaHk3z14ibIQbKdouXfxwpx9kVZyu/3QL5z1e88xd8P46bOmlrddJrsM+e6FQ
         4MmB5gnHtir3V/d9VhZSkpg4OovwGlpn+057WbM+DQLi5LcORdbIk3L+GmgArrsNpJHk
         zM0TzxNkkl0GtSArFjZrvEQ6ilBNBrA5+ymJ6bqPLpOEkgc4u6LsGR0Hl+ghIeO3ehv6
         4YH7AQ3hO5/9s23Pt+cCuLIdevJ1z12shq/etDbfxi8Tw6WfVp6ct4E32RdQ/0hjhays
         YTSjFlk0OUhSssgW6wchWKZpvdGIQ7vMpkMjV82DhzoHGfUMTWxNZsmtRSgPZ5EKOupp
         qTfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726342587; x=1726947387;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ALsTYKzgGgZbnVn1tjPr9vM2XSHNkmqY0xXK29XlQso=;
        b=PMHg0nkzxsWewP8eivJrm6xP+aCfnYy/Blhhv9d89mnMJBHtVI0DXyCRbF0KJ1wRyW
         oaXSZKbHcGk0NuR9K+M/9sDnnAOag9NuhTVPq/VxT7t+1rSx/7ERlCgg98EBrM5Q+/ls
         yCFln0yTQgsXzyWXY9zW3c88OWTLlnJrAzOkPqRjVcyFuP7ocHnby7tlkrMEGtmHx1iL
         +a5a1vv4t1bOlxzUA/WerX+BB+88d0FWkVjUODk7tbYkNehhYQxCHUGi74wlmNnNtMxT
         Jk14/VmyTOzTfugruGP/jm29G9GmbP9To6pfxua4hRoWSjez5fHMwruhkOHuuYc3QaS6
         nTOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXZrWV8S7M+XtnTGvqU5kkzaRESq/AYjUwHUQxOmtKb+nm2s7seSd4TgY4Tzv/B+fkNlmm0BdD/r0MPkXVwRnGCV5S3A==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YyHKqm9lycnOhPxP1QsIkCym3InL3aNp/kjEy/eeB6BQc2XnIrj
	tQGkgH8soXH6kkqs6kXrVoRhS+ZH6jt64Ik/9gpOYab2yloKfMJv
X-Google-Smtp-Source: AGHT+IFffaBty4kRKQuk9Dn8zTFyDBdZTKGT3Uez2+/aIcCrGmmqe2/FTKUXkL+bPOeDtJ3eut5MWg==
X-Received: by 2002:a05:620a:460c:b0:7a1:e0dc:ef99 with SMTP id af79cd13be357-7a9e5eff4eemr1715813685a.15.1726342587187;
        Sat, 14 Sep 2024 12:36:27 -0700 (PDT)
Received: from VM-Arch (ool-1826d901.dyn.optonline.net. [24.38.217.1])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6c58c628f61sm9750286d6.15.2024.09.14.12.36.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Sep 2024 12:36:26 -0700 (PDT)
Date: Sat, 14 Sep 2024 15:36:24 -0400
From: Alex Lanzano <lanzano.alex@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jagath Jog J <jagathjog1996@gmail.com>, Ramona Gradinariu <ramona.bolboaca13@gmail.com>, 
	Nuno Sa <nuno.sa@analog.com>, linux-kernel-mentees@lists.linuxfoundation.org, 
	skhan@linuxfoundation.org, Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] iio: imu: Add i2c driver for bmi270 imu
Message-ID: <bppfwgxbc54jm6cmajgsqrmi25lxmfbsrrqrdvt3tispwl7erw@bb23iymteiry>
References: <20240912210749.3080157-1-lanzano.alex@gmail.com>
 <20240912210749.3080157-3-lanzano.alex@gmail.com>
 <20240914142734.4bcf14bc@jic23-huawei>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240914142734.4bcf14bc@jic23-huawei>

On Sat, Sep 14, 2024 at 02:27:34PM GMT, Jonathan Cameron wrote:
> On Thu, 12 Sep 2024 17:07:19 -0400
> Alex Lanzano <lanzano.alex@gmail.com> wrote:
> 
> > Add initial i2c support for the Bosch BMI270 6-axis IMU.
> > Provides raw read access to acceleration and angle velocity measurements
> > via iio channels. Device configuration requires firmware provided by
> > Bosch and is requested and load from userspace.
> > 
> > Signed-off-by: Alex Lanzano <lanzano.alex@gmail.com>
> 
> Hi Alex,
> 
> A bunch of fairly minor stuff so I've just tweaked it whilst applying rather
> than wasting time on going around again.
> 
> I also changed a few line wraps to keep lines a bit shorter.
> Where it doesn't hurt readability 80 chars is still my preference for IIO.
> 
> The diff of the tweaks I made is as follows. Shout if I messed anything up!
> 

Looks good! I agree with all the changes. Thanks again for the review
and cleaning it up for me.
