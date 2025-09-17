Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D624C2641CA
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 17 Sep 2025 09:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758101598; cv=none; b=JSBxeesSx5k8yciGq2BKsAp1ZB3B5mGxzgDBdOvsdZGBNNOyBj2/hNbD53VWJu6eUFVZ8Sz8ahdWLT6+LjHOpAxLLLTOEsUr488n3cykRGZZ/F9N0SspAtk20e7IJCczGGqvKT7axJoMyfltxhQuXpbm06wTA2gCwotc68I4QZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758101598; c=relaxed/simple;
	bh=oZ25358ZVrqeteNG0nPOUPm0hAC6b9/lBoQKa+CuvY4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=N7cAdedaFP8F5U99FTBtb8pyGGJzHQDBD1Mz59nWrSo5el5AFVC4riTMd17eaAcqcZi92dwzB4yZ3jB1usDR+tpqnEgV71Smpm6ADpDIcoo5xOTyqYk4az4tfvKqTnDaJWcpnYxsrbbPC7fvmCDK9AUC5gSDgDu/3FPm+Xz4ShI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VYgkSQbP; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VYgkSQbP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758101595;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=89BDSPXQuFlvPv95q9QMB56awWQ5KCn+7gDQqVOL5IQ=;
	b=VYgkSQbPWO35QAT4LrBHQgDH2eQDAF9AMNWv+gXKDvRea0V1jIyswTXiMO5RYQeDwGCoam
	gZw30zyxwCBWe0ytphFMhu2gBNl0Q6Pd0jF8iUNAI/d0TzSSlLpKQzG0/5zUX0J6bK6xLf
	uWcpX2YMpx3QcYHhR3jgveso9KjC5F8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-12-OWG9LdYoMkaetgsGJBiL6w-1; Wed, 17 Sep 2025 05:33:14 -0400
X-MC-Unique: OWG9LdYoMkaetgsGJBiL6w-1
X-Mimecast-MFC-AGG-ID: OWG9LdYoMkaetgsGJBiL6w_1758101593
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-45de13167aaso58690415e9.1
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 17 Sep 2025 02:33:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758101593; x=1758706393;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=89BDSPXQuFlvPv95q9QMB56awWQ5KCn+7gDQqVOL5IQ=;
        b=nwqZ5GYK0N+XmZWlZblVA4Ozwpqrnro3RB+ylN7vmzqjpU8j8C0XPThLMmpHim9LEz
         WihMA3fDLrUamsw0srwhnJfMuAS0/hKTNM+ydlXuYZ+0NNcQj1Opt3R/mZLgCpHq/0LS
         agMuuakr7Cdhd2tfaxHEieSwsKa0ZGiwF0WhzjLIaLiU7CWLrmnWKrudZXlDLbue2LIw
         uIgmuvfXr+1uQ2QTcSarzJD8lKUNu3XBZzKnv/WiN1zKVma8oAn9m/97XyztsRhTbP/q
         pKDRfebqzT1KkP/W+B4RaVu95AiRcsnxjkijTN6PMq1LdTcMtkXEPnAsG9Evkfhi1CNT
         7JBw==
X-Forwarded-Encrypted: i=1; AJvYcCXZoaCveR+VdtkG6diLzyKBevZtwtQs+cwRc0C0d54qmHAo/4zM+Xn910x3odkibDWpKsDmZP6yL9LNc3DEHtbEAxYwKQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxZ3znyjPeTmvKL6xFbC5tJjdNtaH41yPstgvpPgw+HW3HhAUwK
	VLSK7OcYzRusowRQY6P7CXegSVKcRp473mRXZh9CV2lYllH0PXwjQi2g7fFfJXerbo15AXyqGQ9
	QBPWxik2ZtPuAgjlWBvIgawwwZnEo6/lzO6BPso5A6VmrOz9vCHNInpEIbuZIAnZXREeFRf2nLu
	Er
X-Gm-Gg: ASbGncs7GSdE/lNrMjrQoFZzQQbNTZg4zQCq0Wlv1bbKyVZPHXO6aJQ8NBOaLcMT2Fd
	PIIfvzkJk4aY/g23CF9FT/QcFMAAN6TxtIGuAbnyxI0LVH6EyUDx12rrajCVHi6SEMGXpz64ngd
	ACwQ+P62ZvuONd8xOJwyj4vEmKEcm8iqDsUBks5AxY7Pj2zc3tdJJgNgZOoiCiq+THv+Slc+9aQ
	UHMl+vFIsMPSzuyissbpXhUU4NT+9PCszT22K+5Z+OlM4K8QzTT9IxFlI2G94PSMNTrHCs3/Rkp
	W2s0zIDb65KQ12gyY3pa+tyw38axZ4wi3RGj6qybq9hHX9d+RG0DNoryPPc1MzmYZH+SklNA2dY
	jR+MSw0S0SPgOdjbtPNN92Q==
X-Received: by 2002:a05:600c:1f8c:b0:45d:7d88:edcd with SMTP id 5b1f17b1804b1-46206b2e1admr16045745e9.30.1758101593133;
        Wed, 17 Sep 2025 02:33:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENXZ4rn06CVJu6gZ71Iaf2lGuFxnBG38Z3AWJjORTvoJCFn1PWRhC71R9PJs2NEILp/czqrA==
X-Received: by 2002:a05:600c:1f8c:b0:45d:7d88:edcd with SMTP id 5b1f17b1804b1-46206b2e1admr16045405e9.30.1758101592738;
        Wed, 17 Sep 2025 02:33:12 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4613869528bsm29227745e9.14.2025.09.17.02.33.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 02:33:12 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: James Flowers <bold.zone2373@fastmail.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 skhan@linuxfoundation.com
Cc: James Flowers <bold.zone2373@fastmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] drm/ssd130x: Use kmalloc_array() instead of kmalloc()
In-Reply-To: <20250914073841.69582-1-bold.zone2373@fastmail.com>
References: <20250914073841.69582-1-bold.zone2373@fastmail.com>
Date: Wed, 17 Sep 2025 11:33:11 +0200
Message-ID: <87ldmdo23s.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2a9tz_fgtVNbqkd-STuBHNrU-LjyElyEwHDfcziJ5do_1758101593
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

James Flowers <bold.zone2373@fastmail.com> writes:

Hello James,

Thanks for the patch.

> Documentation/process/deprecated.rst recommends against the use of
> kmalloc with dynamic size calculations due to the risk of overflow and
> smaller allocation being made than the caller was expecting.
> kmalloc_array avoids this issue.
>
> Signed-off-by: James Flowers <bold.zone2373@fastmail.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

