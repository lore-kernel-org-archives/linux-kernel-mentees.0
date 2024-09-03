Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D831AD262
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  3 Sep 2024 09:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725355066; cv=none; b=NpkF5PX2x/l1edTG07o/JGMuPLQx7/YI2+AxHYrvRWao8F8w7dOespT5GfkX7+t1L736vSFDmmmQ58xHpXgf0Zi3Dr/obgeuMrghNpkKd6dNVa9GcoSuyTN0uAiX3uGCI6KckNwWTwj8JFtYZiql9Lv7Q7RR/i4e8cEG+f4Hcek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725355066; c=relaxed/simple;
	bh=xPOB/Td0YOX7rUyJhql0/J3I8D/m/0TzQpE86H5G0Jk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=UDFEmKEPFQscmdQc/bQGjzYuR/pvJl8gtEw9ezEc1LOxF+xHpTgeu8HE8iRnS6Iu/yX5CjrwoN4mG9S7sOJvLispwVtZzic4Q/bqbpDgXW2XuBwg2iqZC4d2tDkLRuvcRvCQScWf3vyWNvvHeNR1L4FDXGarvsEMFPzD3g+aHng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=a6JFqxfP; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="a6JFqxfP"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3217980DAE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  3 Sep 2024 09:17:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.79
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iLjKsbCd0NDQ for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Sep 2024 09:17:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=fmartine@redhat.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E2EE280BD6
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E2EE280BD6
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=a6JFqxfP
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp1.osuosl.org (Postfix) with ESMTPS id E2EE280BD6
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  3 Sep 2024 09:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725355062;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=d9X1NNLzucsrIUJA/W+nkx3jW6oIqsnKng1xNjblM64=;
	b=a6JFqxfPzFXBAJ6f601AKSO6d2x7GnFWnevFRNupPWw4MLPuSJ37QCXSBtX2R07XyYSKib
	YqTa/rLHU1OEhr+RADvWcq1FUVUNZUUBupSSCyuDzlOZ+RMAebAonXanle+g274unNu6xp
	wHhU270BVolF7eSqlJxznsAGu3B/Cjg=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-686-1qFxYJJ2MnWxZqAcKFfaeg-1; Tue, 03 Sep 2024 05:17:41 -0400
X-MC-Unique: 1qFxYJJ2MnWxZqAcKFfaeg-1
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-5334acbac00so4734752e87.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 03 Sep 2024 02:17:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725355059; x=1725959859;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d9X1NNLzucsrIUJA/W+nkx3jW6oIqsnKng1xNjblM64=;
        b=TlJLEMkXcThqlE2/MAa5sCwk8qJgh8528GHUS+EVeyw4Y43g9OqDhmpeb3UTmiVKYS
         Xe9KvzNmwkMajwy46ejh6hQvtZgO5h1wYFXU5N6mCLl/Qo8wH3TtCMxuN3+cey1xhUiu
         UF6A0KIiOm570Me09Y8RBwkQ72lXsEd9aSMHUEx57x46xP2cBHKFmvKG2sPpVvxvVOh9
         KTQMzTKNX5PSw5cDs7YDk7SPbZfYu56ODD+O8M4puupsphauWCBbtzM8dAJb38oLrxJ3
         RLzq0ta0uh7ZqTCNFZFJ7LU8JsC8azSkr0J9PCM+9F9DmDDbAHgrbKJKF/6cLdWbdyo9
         wjcw==
X-Forwarded-Encrypted: i=1; AJvYcCV0y8Fwbt4CcyztT/NE5xicWSORPXlCYfvhYi/7h8KULa8bNzsGFBtZ5EEMMzh9M8l2qgHEzo46baNk7sJkD20MXawkRA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzZY8LdaqD+xGCL+4u+h+VHZYkWo0v/4SMjJ8z1cC6rEk4/1X5A
	bwMtqHBz+KVLGCpdWlzivWLBNMODjUgHB+5+cEtAx2PTZWosDqz7Irnc56Fhi1naQ1AlCyGe2Lx
	tu2yjdSstDu9/4G88U6vkicNNJqhBTkeUFK6qLXQN+/pz2YWoUADAiQ+ReDw3DLQbuvHgHlIKmX
	WRF5CppszCZA==
X-Received: by 2002:a05:6512:1328:b0:52e:7656:a0f4 with SMTP id 2adb3069b0e04-53546b93f39mr8985501e87.41.1725355059623;
        Tue, 03 Sep 2024 02:17:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF3xeKyziMqcDCx9+tKLN9bJxYrhVG6uCV34wc0/n7HkAIUcH0MBCdLafl7DwaQE1ysW+KWKQ==
X-Received: by 2002:a05:6512:1328:b0:52e:7656:a0f4 with SMTP id 2adb3069b0e04-53546b93f39mr8985480e87.41.1725355059058;
        Tue, 03 Sep 2024 02:17:39 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bacaac810sm183985045e9.33.2024.09.03.02.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 02:17:38 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Abhishek Tamboli <abhishektamboli9@gmail.com>,
 neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch
Cc: quic_jesszhan@quicinc.com, skhan@linuxfoundation.org,
 rbmarliere@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/panel: hx83112a: Switch to wrapped mipi_dsi functions
In-Reply-To: <20240902170153.34512-1-abhishektamboli9@gmail.com>
References: <20240902170153.34512-1-abhishektamboli9@gmail.com>
Date: Tue, 03 Sep 2024 11:17:37 +0200
Message-ID: <87plplgkpa.fsf@minerva.mail-host-address-is-not-set>
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

Hello Abhishek

> Use the new mipi_dsi_*_multi wrapped function in hx83112a_on
> and hx83112a_disable function.
>

IMO commit messages should explain why the change is needed and
not just what the patch is changing (for this one can just look
at the diffstat).

> Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>
> ---

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

