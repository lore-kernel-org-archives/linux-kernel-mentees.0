Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85ED225F99F
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 25 Sep 2025 08:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758789923; cv=none; b=CnQRfhL/zLwFTxZVJqvbuJw/es9rtEmJvy4BbjaGPJf7tnCDqAHX7KRRsTHO44YW5WLW1Vx+QWLdIOOn861QmQgdf9aE0HdRtAQksHaDYQ/H5DE4CI5yUZowKaw1eqPFsAC90dSyi/QRhBcEtfEyPF/wdaRJ8GLtlBHWoPf947g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758789923; c=relaxed/simple;
	bh=qC1aIoK5yYcF83FkI9Dqc3KWerwB3ZBIP/sva6h4a9w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UYpRQZCZzT8L5R7El5Oc4z5iBhCDgqiArIzKTX4bmqHMlbM0FVT5JLeu7L28nJ7lU9RN8NBshZfaz4Uwdv6zfOUvTlrnmQkkXAi25jVQCxEITDxHn9yn2tUA266bEeK6uPH2ZHL+ksDd06kvjW0YAgZnib7ot0W0rCBg3hcv0gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OC33709i; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OC33709i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758789920;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9ShWX7vwoNNn+VH+yd+QMji4HEbe496xkh5xSQsMnu0=;
	b=OC33709i+7jes+BNHIYwmWUuhZB5B0QKUBIiVnAHL3sD5hI7uyfsCbs3qWTf1fMmahHwaP
	ucrAMgpbMQgOv3w+UtE1oKHHpj/5fVa1kl+7fAOhJ/4vlP9U/jB3fFefUtUYu0SWpu+KGX
	036BD334KCWcwiWRNnYgCJfetRFOhhE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-308-9qi30PdVO3uoKZuWOD3L5A-1; Thu, 25 Sep 2025 04:45:18 -0400
X-MC-Unique: 9qi30PdVO3uoKZuWOD3L5A-1
X-Mimecast-MFC-AGG-ID: 9qi30PdVO3uoKZuWOD3L5A_1758789917
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-40cfb98eddbso499357f8f.0
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 25 Sep 2025 01:45:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758789917; x=1759394717;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9ShWX7vwoNNn+VH+yd+QMji4HEbe496xkh5xSQsMnu0=;
        b=GSybxJJbMNvVjBLzuvtrjQqhnE3a3QDAJeLb8+l8YHPFD35ilXCGq+r5RsRVsx6eh5
         PV1HBfqbfbwtk6BHfGD9NQ/K9ZgFiQgmVOVvMvd6F6IU6ufMLEWrwr3hfLpq42kK8j3+
         Vr50ugsnktmrgZPnfD9uqMdhGJl1R//Oava6wrrtzQpljtB9oOGlXFS1svNl+ujglFi9
         WRyTFUWg/KGFZNZqCeIBZ22RQfJtL5aERHGQb0mM0789JZAGIaUR5F8DUuwwPWRkFbps
         ehh80QpF1dGlxImlJz0RvdX6HWeUuIAuKMwPJF1pLeVUZXgFeG4NHi1a9DuTtG6X+Gr2
         Biwg==
X-Forwarded-Encrypted: i=1; AJvYcCUYk68loaGMOuTAEATQm/buGz7KEv3jAaxUbVSTYUoyKeFCf1RCYiobegWL3slR0/I9emgl8eNnq4lHZfrJHGJujyesaQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywn+452bdU2Y02sxV81i9VtJusIfmacwKNl98smrTV2v6ZLF9XF
	7m9aMt4GBt9DrfKmpIWIOaHUPub/lMuLlOLBXjfLiCzOzRXCz5TMRljjfymjvXw3nXd3rD5a5pA
	VTWIFfa6daqDHFVOgULR7Qvv8gaPdP5Ta6d6WnvJNmLgXoEH9no/NgylZ0oKuo7805EHh8cOc0I
	h2
X-Gm-Gg: ASbGncsw+vgXhMRZxPiy0tgMqbwzjTI+O6aFAHnH9Hqw5WUUFOUf2s9ZqhMIaGkAgAz
	nI9M6N0P9D/wY30F+6TwZmAWRKballW6OjABmgcz1CL6lLZZnyP0iB7vpJ22d+eljjx2IiUNEgW
	dEK4x+PEo0g/tfZAYrfqw5GL/S6WBupDa+i8WKCXGS+VIRraShW45+EQa/eqKR562xlA0pY/QJY
	RPZAILBRtQKVXOkmaVAG1hr/x8JfJJ1D/ibQWmYQ8+1GMvfHypaY9Fg+8LY8nUEQ45Gba8jezKp
	PNI644bUpMmJLbMVzkpIHcx8Nnymu7GX4kYzGKgV3RfKluAgmwfdLDOxhe1XQeWWAuv8WqpmPDk
	boyu4Bo5B4Mhz
X-Received: by 2002:a05:6000:2302:b0:3f3:97df:a2b9 with SMTP id ffacd0b85a97d-40f652293d8mr1558666f8f.24.1758789917244;
        Thu, 25 Sep 2025 01:45:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH8MnKrqVU5iaRZyEisFTtWADltgBvMSKns5i2HHc+LVMjxuzcCkWpGyCR51gWllXQXpAW+mg==
X-Received: by 2002:a05:6000:2302:b0:3f3:97df:a2b9 with SMTP id ffacd0b85a97d-40f652293d8mr1558628f8f.24.1758789916763;
        Thu, 25 Sep 2025 01:45:16 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2712:7e10:4d59:d956:544f:d65c? ([2a0d:3344:2712:7e10:4d59:d956:544f:d65c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-40fc5602dfdsm1974284f8f.33.2025.09.25.01.45.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 01:45:16 -0700 (PDT)
Message-ID: <f95da89a-152d-4899-8068-3b6aab568825@redhat.com>
Date: Thu, 25 Sep 2025 10:45:14 +0200
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND net v3] net: nfc: nci: Add parameter validation for
 packet data
To: Deepak Sharma <deepak.sharma.472935@gmail.com>, krzk@kernel.org,
 vadim.fedorenko@linux.dev
Cc: netdev@vger.kernel.org, stable@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev, linville@tuxdriver.com,
 kuba@kernel.org, edumazet@google.com, juraj@sarinay.com, horms@kernel.org,
 syzbot+740e04c2a93467a0f8c8@syzkaller.appspotmail.com
References: <20250921182325.12537-1-deepak.sharma.472935@gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250921182325.12537-1-deepak.sharma.472935@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QGp6dEZASQc5gZ9qNx1lQoWqF82DUPmOL0BBacQLDuo_1758789917
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/21/25 8:23 PM, Deepak Sharma wrote:
>  static int nci_extract_activation_params_iso_dep(struct nci_dev *ndev,
> @@ -501,7 +536,7 @@ static int nci_store_general_bytes_nfc_dep(struct nci_dev *ndev,
>  	case NCI_NFC_A_PASSIVE_POLL_MODE:
>  	case NCI_NFC_F_PASSIVE_POLL_MODE:
>  		ndev->remote_gb_len = min_t(__u8,
> -			(ntf->activation_params.poll_nfc_dep.atr_res_len
> +					    (ntf->activation_params.poll_nfc_dep.atr_res_len
>  						- NFC_ATR_RES_GT_OFFSET),
>  			NFC_ATR_RES_GB_MAXSIZE);
>  		memcpy(ndev->remote_gb,
> @@ -513,7 +548,7 @@ static int nci_store_general_bytes_nfc_dep(struct nci_dev *ndev,
>  	case NCI_NFC_A_PASSIVE_LISTEN_MODE:
>  	case NCI_NFC_F_PASSIVE_LISTEN_MODE:
>  		ndev->remote_gb_len = min_t(__u8,
> -			(ntf->activation_params.listen_nfc_dep.atr_req_len
> +					    (ntf->activation_params.listen_nfc_dep.atr_req_len
>  						- NFC_ATR_REQ_GT_OFFSET),
>  			NFC_ATR_REQ_GB_MAXSIZE);
>  		memcpy(ndev->remote_gb,

I'm sorry for the late feedback. The above 2 chunks looks unrelated from
the real fix, please drop them: they will make stable teams work more
difficult for no good reason.

Thanks,

Paolo

