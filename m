Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C231D2F69
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  4 Sep 2024 12:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725452315; cv=none; b=eRJq7rb/P+BGFaoFIqk85fQl1K8BX3of2xBFRsp7stAPDWyYf6mDiDCG8UqKptcibssXmPIPK6XYgEehcswcG8erMedSQYT/5dWttkMvOa3LPk9EBJpoQxiyYWArWOt67T7i4JiVZ86XyJCy2uU5PcqfM56Io7ueTVa/1no/AJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725452315; c=relaxed/simple;
	bh=aDfOCfO2pRprM4ipOkB4bYUPfKw3QrJjVh9Hmr4gZGk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=juvTMafx3ZMDhYYcN16y93Z01cRePcPp9SLd4g1W5THmqMBx+H7i9IrOt85rydOU0xttp+gWxZjvYPOqnz2o+SEA6htN3k64ydnPDyevmXdUNEaNeYdGKK1BO/GaqF7Ug1SfWvL74d9ZvWh3CVLJyJI85rHGMaoPwXUZcFTYg2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ww9ui26f; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ww9ui26f"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 76B044029B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  4 Sep 2024 12:18:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.79
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kO1cOP8x6yya for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Sep 2024 12:18:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=fmartine@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 607EF401F6
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 607EF401F6
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ww9ui26f
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 607EF401F6
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  4 Sep 2024 12:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725452310;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ff0y4X+QVhf0p/VEjOvJFSOlimmYM5QTv85PADhlasE=;
	b=Ww9ui26fwT7Dbd8iRemN/yaT8uanQHyT35Zvd7uTZ3UxERSLKRsLzdcMQe/e5cWkqvz1Zc
	+UZXpiG3KaLvQHrIYaRP7dsN7bcK6amyc7o7ym2Af183HW1uUu07j8DmPh3O3OLCU40apG
	NW1IWcG/DeFTqMVBr/5dGleP64XsQyc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-336-LIYHsXNjOiWJF_enB3sQFg-1; Wed, 04 Sep 2024 08:18:29 -0400
X-MC-Unique: LIYHsXNjOiWJF_enB3sQFg-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-37496a7daf2so4355495f8f.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 04 Sep 2024 05:18:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725452308; x=1726057108;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ff0y4X+QVhf0p/VEjOvJFSOlimmYM5QTv85PADhlasE=;
        b=FhZ4ijkLnZSCMcivCFPUWOfzcQfz1uTT+NLrxNslN1hOd+QnzXeR4DlQQ8xu88BQHa
         p+E4mGjuvYqfc9b+nqrydiBnQ6hF3SJzNWsGdoPMc+7nk5pzgBzcysCecsRN+yKZw7VY
         l0pcDK4iM7oTOp5K8Co2laSVxKDCZaZalcdB2YshdFQVghAIa9CAOgIU3GjxwLHPD4Zh
         +dUVAI2fDEjVonBgK6faeOKALo23z0H+xl5ULt62e2auGBCMEA2pnGQO+HfzxC6CpOeJ
         Tte61wBE8qVZpZLN6Kgd4BXJtL5lgkyDQciI5GxYfc0dLWWhHs1B4My0IgQDkJOuWNW0
         U71g==
X-Forwarded-Encrypted: i=1; AJvYcCVUwbhtZS+Fx+83lU0j5qfnhKC8AJBh5CAoium+xtPPcNgtinnD2h1IBr36LMsrh3P8/GAKPDc6xLNuEE8zG20nXxFk1g==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yw3hluqM2iEcURY1AWLLSF+NCp4UoW7wsRMbSKxVshY6rAoW0o3
	3KMS1wHh1qZbpIwQTVRSIdxSiefJj14p7ADodzK6KU9QTWq5R9XcpWt6LEkvmALtRsHVzMXoss7
	H8qXgHDE31olG4NbLLwUBHI6i3878IhD5Vi2WCPtni+S+R3FHDyIOzBf8e0EHCQBB6agubH2Lka
	vfs9L4dqklIg==
X-Received: by 2002:a5d:5484:0:b0:374:c45a:8afb with SMTP id ffacd0b85a97d-376dd15a9c0mr2962477f8f.19.1725452308148;
        Wed, 04 Sep 2024 05:18:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFM58SacVW6qB3OGbwInnBlOw+x1XdCaBLKOjGAVJ7DXNTIXZ7mf0D4cAdkVzP6Q8BUhRUNrQ==
X-Received: by 2002:a5d:5484:0:b0:374:c45a:8afb with SMTP id ffacd0b85a97d-376dd15a9c0mr2962449f8f.19.1725452307586;
        Wed, 04 Sep 2024 05:18:27 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-374ba30d5b8sm13069521f8f.15.2024.09.04.05.18.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 05:18:27 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Abhishek Tamboli <abhishektamboli9@gmail.com>,
 neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch
Cc: quic_jesszhan@quicinc.com, skhan@linuxfoundation.org,
 rbmarliere@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, kernel test
 robot <lkp@intel.com>
Subject: Re: [PATCH v2] drm/panel: hx83112a: Transition to wrapped mipi_dsi
 functions
In-Reply-To: <20240903173130.41784-1-abhishektamboli9@gmail.com>
References: <20240903173130.41784-1-abhishektamboli9@gmail.com>
Date: Wed, 04 Sep 2024 14:18:26 +0200
Message-ID: <87v7zbboj1.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Abhishek Tamboli <abhishektamboli9@gmail.com> writes:

Hello Abhishek,

> Transition to mipi_dsi_dcs_write_seq_multi() macros for initialization
> sequences. The previous mipi_dsi_dcs_write_seq() macros were
> non-intuitive and use other wrapped MIPI DSI functions in the
> driver code to simplify the code pattern.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202409040049.2hf8jrZG-lkp@intel.com/
> Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>
> ---
> Changes in v2:
> - Update the commit message to explain the reason for the change.

Thanks for improving the commit message. The change looks good to me.

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

