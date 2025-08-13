Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E582FE58C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 13 Aug 2025 12:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755086970; cv=none; b=OXOa4w1EacaO8RjqkiV2pUNPVO3YZK2MmC54v6mdhNFHCZ1xgvfhzyFzAxoZUiX38bhbpwLRyn5Q3n/RU1lxuy6WZ73w51kOmzk+gI37CqFdrH1VLRVU/QRsdGqrCO0lT1LndYjBGUe+AGyeH8FxQMlhqo8Tn2VF8V2TbIx9ybI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755086970; c=relaxed/simple;
	bh=H8g91jdJ2I5Pf8/gXHixSVo5JI5EuDOSta97uJaRL8k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a848wtNNfWf4ZPtaipMkiVqZP3n0PPZJkYiKODr5rVlTVwmwx1cAeT4qMh7gPnRmW7eWDPJjFiLBU96cITm9smheeXOWXKsW+cqZSbV7+QTMiYjLdywruoHmZYRRTDY53HGlt0EXjEVD7dRzKgNxBk8/yuP3g+/Utm5O5Kdx3lU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ct0ZEWHB; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ct0ZEWHB"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B25C5400A7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 13 Aug 2025 12:09:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: 1.486
X-Spam-Level: *
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9kKwI0cSF9jc for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 Aug 2025 12:09:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=sohammetha01@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2491C40062
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2491C40062
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ct0ZEWHB
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 2491C40062
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 13 Aug 2025 12:09:27 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-240b3335c20so42118665ad.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 13 Aug 2025 05:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755086967; x=1755691767; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O1ynA9yNCLb/DJJBcL2J9BbHmd/+2r7TiLGTA87x+sQ=;
        b=ct0ZEWHBmUK0RtS9bJUZ6+LKmuoPQRhfK8A1ZY3DyYJ9zFdbLFrEQLV29hwb8pbFhQ
         nz2IHuCBEVSL3LuzQqDr4HNOgAplcnWcxsiobxXk0M6dC3q00Qq0B19q1u3bcyQM5cQx
         tAqzpvHg1OdBjx8cxMTN4mwi2WQataZkAqFMVF8CGQ3hDHhFA3VFg2Nu2sNB4D3tEF3Z
         EvLoDDxk8yOn3nF8O5JfvKkMu2JzhCeME6/8Q5DGjqAEcB7nyyMNGrEmoOM1F05COR5n
         IAT4kBQ7mrrBvGAjpp6YRdX++t/9kCzNU/gaNMA7nV8njpCM01feVTC/JWEMgmiIwN5Y
         KkmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755086967; x=1755691767;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O1ynA9yNCLb/DJJBcL2J9BbHmd/+2r7TiLGTA87x+sQ=;
        b=SpcyqknO94GXaZyf0CsRF6+8AjmApc2GJkfN5EtM6RCNZC934eTHEqAWxFMDg65HMU
         EbCjaUtHvmZ1emIQ6B3thTOOQEK9uoWM1geuTyU00LJ2BB0o8qzg80eMRX5pfdHwZD70
         nl8E+qAUg9dmg1gI1kWbyRXAjbBnh8vXs5nTUDrunqbYj2Xnda6gOMtzlhPg2C+gQL2m
         OZhJdrfYgzD0dMw6pP+4JSsMfeQsRHGvory2ZZSl0eTNrl5GJYdnOskCrUXejM8cejn1
         OdzS+LJ82OVBGgMIQ4wpom9Hko3gImsNGZ5ZEOQ6wRsduj8zWRM5bmyKGjP3Yp6v86r5
         mJHg==
X-Forwarded-Encrypted: i=1; AJvYcCX98mfswy8Jz58/YuDESbOvzekjIjPrYihPoA7AdXj/Q97CR7I59P1ZlE494IR1DpLE8g5IlIuTOs7L1OIV26KtpdKthQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YyANLaBLL/WsYmNNsRYDBDx6HvAePH9ZMRh7Huc+RvFfyXwM8PB
	McWUt8eFk3g1uLR9ZN2LmGdNkX2kRVH1QuwdRdcuh/nGkPtcXkfDoC+p
X-Gm-Gg: ASbGncuEloKbfvesOnZxRFjdI1mpIjuu8sZpKMBXULmIYz2fvWQa3X/Rlx0ESqwagEW
	l2AkReAw+KP9I+NlZ8TiChOysRJW7PPOW6H3RZK94iefhzYgcxIm2V7Rv2p9+tktkCXmfVgpE2S
	MZRfCP45FIlenMUSzVcO2AP2ENy50Qq1/BMYY1H8hRQjNBoGB4vj1x2iahUdk2SrEMgg7S1Kq9N
	sELpf3KgmWOV9VW3WQkAuw4oIvRdCH8CAIYNwqC4LoDTRbehD4DyQeegKyU7mRnY7frE0vekuqn
	5/oLBM3A/HsUCM88wssXW1BR4LIq8iqzRr1USBNJ5fSbkageZz9aI1GCO8W5forJiuwpnWwHCTC
	It7z3rUycmXP1DC9HCKe5D0TfDmekbZg=
X-Google-Smtp-Source: AGHT+IEKxlh5V2GF8tDsf9jD1Ub2AHyeBNd/wpCv29SX9TggXc56K8tKdTw7IPvGqUw42iV6V+rong==
X-Received: by 2002:a17:903:1ac4:b0:23d:fa9a:80ac with SMTP id d9443c01a7336-2430d142278mr41905825ad.16.1755086967165;
        Wed, 13 Aug 2025 05:09:27 -0700 (PDT)
Received: from [192.168.7.13] ([103.182.158.108])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e8977896sm324251535ad.79.2025.08.13.05.09.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 05:09:26 -0700 (PDT)
Message-ID: <dcbd352d-2474-4d83-b7b4-1dce2932c9f2@gmail.com>
Date: Wed, 13 Aug 2025 17:39:21 +0530
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/9] docs: alienware-wmi: fixed spelling mistake in
 admin guide
To: Kurt Borja <kuurtb@gmail.com>, linux-doc@vger.kernel.org
Cc: skhan@linuxfoundation.org, corbet@lwn.net,
 linux-kernel-mentees@lists.linuxfoundation.org,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 ilpo.jarvinen@linux.intel.com, hansg@kernel.org
References: <20250812201523.69221-1-sohammetha01@gmail.com>
 <20250812204952.73136-1-sohammetha01@gmail.com>
 <20250812204952.73136-3-sohammetha01@gmail.com>
 <DC0RIMIRP717.345GQONQFW4HI@gmail.com>
 <dea5d89e-d918-4d80-a205-38ca7c166cc3@gmail.com>
 <DC10RH2NVBR9.3QC7LKK4O4CW1@gmail.com>
Content-Language: en-US
From: Soham Metha <sohammetha01@gmail.com>
In-Reply-To: <DC10RH2NVBR9.3QC7LKK4O4CW1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

found/fixed the following typo

- aproximate -> approximate

in `Documentation/admin-guide/laptops/alienware-wmi.rst`

Signed-off-by: Soham Metha <sohammetha01@gmail.com>
Reviewed-by: Kurt Borja <kuurtb@gmail.com>
---

> You are missing mailing lists:
> 
>   - platform-driver-x86@vger.kernel.org
>   - linux-kernel@vger.kernel.org
> 
> And platform-drivers-x86 subsystem maintainers:
> 
>   - Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
>   - Hans de Goede <hansg@kernel.org>
> 

Thanks for the clarification. I have added the missing mailing lists 
and subsystem maintainers as suggested.

---

 Documentation/admin-guide/laptops/alienware-wmi.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/laptops/alienware-wmi.rst b/Documentation/admin-guide/laptops/alienware-wmi.rst
index 27a32a8057da..e532c60db8e2 100644
--- a/Documentation/admin-guide/laptops/alienware-wmi.rst
+++ b/Documentation/admin-guide/laptops/alienware-wmi.rst
@@ -105,7 +105,7 @@ information.
 
 Manual fan control on the other hand, is not exposed directly by the AWCC
 interface. Instead it let's us control a fan `boost` value. This `boost` value
-has the following aproximate behavior over the fan pwm:
+has the following approximate behavior over the fan pwm:
