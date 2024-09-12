Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F402AF16
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 12 Sep 2024 01:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726104263; cv=none; b=WF28cYUl3xkIwm0UJaKU5N7lA/GHsLAvQVjsEE/Z9LNffPV4TcwJ90Pik4crajb0TeIwZFH/8ueQh6BqAvYHB6pH8cblz0W51MvO1yjuz8NZLA9Tz8QIoGWtg5bTZff6Vp+riznTsgjLI6KblULG6MskWnwCy4KTMz4OYUPhBgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726104263; c=relaxed/simple;
	bh=WCkz1wA2fycZBda5JGyZBgMJFp+mm9qFOsBC82gpG+0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c1VO9/K0+FcdHdGmmOYtiTUGmNOTG4TZ6Kyf7XbXPajO+AvzrF3gftlXmab8GgOf/2ACErpAix2EBrWqUDsbbAUv3fJktPrrzI3vMBS6kMyV/xttBm9F2CIK9Pgei7/YLLt61/35V5qnH00t4JZQ4qxMgTLJL5gU13TouVop/jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=A+/gTCba; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="A+/gTCba"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BED666065D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 12 Sep 2024 01:24:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vAqqwuUOyVLZ for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Sep 2024 01:24:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::f2a; helo=mail-qv1-xf2a.google.com; envelope-from=stern@g.harvard.edu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6A6C260646
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A6C260646
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=A+/gTCba
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com [IPv6:2607:f8b0:4864:20::f2a])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 6A6C260646
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 12 Sep 2024 01:24:19 +0000 (UTC)
Received: by mail-qv1-xf2a.google.com with SMTP id 6a1803df08f44-6c354091616so3397446d6.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 11 Sep 2024 18:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1726104258; x=1726709058; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UOBcbGANHO6y2IqBbxXHcJn4a/lLLiljFUakrQAD5yA=;
        b=A+/gTCbaadcxIfGjPhJ0qrtZ7TbjOZZJW9yFSUM2jnWOpkIuW0L3ODA5JCvTO71dNj
         kKeaU0/IwXYjHyqKJTy1gwzYCbL0SXQQGUO5Ot9UMGrrjKUqgtfVsAvDql5HpB2lhm5j
         Yyu2gCxTDbhZIYwDTgJ6xqumffIz+zV6emd7/iWZT5s1F16jUf9b+Mrl4VzK3oBUy2Oc
         uMtXOfUiExpVKUCfJheOBYodSYCWz5KuAC8hOOaJ8/2s6fpxxGk1Defp2HyqUA9RGSGq
         +ORBQ+D3Pz9uICkMWVysv5bRqXM5I4PlIRuMqSteOrZsCH8Q3XPyfdA0FJKiAud2VjCV
         4zmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726104258; x=1726709058;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UOBcbGANHO6y2IqBbxXHcJn4a/lLLiljFUakrQAD5yA=;
        b=mGKvPyfvTaM29NG4roM9+GLRtCgbpQOBo5DOrWKkFArdY32buSV8HexQF4vCiXD/X7
         OeLlcV3dV8aI1EEUtjvnSbKhCx4Q/6mcZTbD1s9Vpux/nENoV0eKJVLjYa2Gkjh3N1Zw
         UrWHwpmUnQ6rlLbX6OZnu0IvmCte0p4AaWXiH7x6DzPGi/Er1eBG6a701CB4O3prmc7d
         qDrNZbJF+U5/mXpHZxbHUHotqoYmNHV64E3WVd0KwajiwCtphnO0jrQm9Pyj5yxgTpAT
         E+/FTplElaiguDERh+BiCZdEBUlT6CELnouqsUFT5dy/78eDcKemVP9JCpuSN1USFv4t
         SZ7g==
X-Forwarded-Encrypted: i=1; AJvYcCWGP9lr4+eL34L2RKnWTD9O7MgjA0TP+uHpkqcrxNrZeQUR//cGlYGAafE2CPhCOs9lp0CYLPX3fCio7Hi1gSdqpu93zg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YwXRVieVGDrydJhHeOD/klr625Lo+4mQgF7sRglLbFdBz46jrbQ
	cbf+hhsHmzW2XD/TG8OFICd3PVXEK5O/9AGhkTkBa2exsHzjjAj+CShArNxX7Q==
X-Google-Smtp-Source: AGHT+IHWQKUeoPplqrp5x/XBdOkpDoc8ofhwXw7/GlSPZnBvRMV8tbR7gftUmg6tL5QhMLHyJVJdfQ==
X-Received: by 2002:a05:6214:33c2:b0:6c5:64b2:71c3 with SMTP id 6a1803df08f44-6c57352e2a7mr24620406d6.25.1726104258431;
        Wed, 11 Sep 2024 18:24:18 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::ff03])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6c534786129sm48099016d6.135.2024.09.11.18.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 18:24:18 -0700 (PDT)
Date: Wed, 11 Sep 2024 21:24:14 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Abhishek Tamboli <abhishektamboli9@gmail.com>,
	gregkh@linuxfoundation.org
Cc: usb-storage@lists.one-eyed-alien.net, linux-usb@vger.kernel.org,
	skhan@linuxfoundation.org, dan.carpenter@linaro.org,
	rbmarliere@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: storage: ene_ub6250: Fix right shift warnings
Message-ID: <46a5f308-5d0a-4e41-82aa-5bd9cf81d35a@rowland.harvard.edu>
References: <20240729182348.451436-1-abhishektamboli9@gmail.com>
 <e72cc56a-3066-4cb8-848d-bfe27a48c095@suse.com>
 <ZqkpOQIjcBSAg8rC@embed-PC.myguest.virtualbox.org>
 <5d7870b0-6b63-430b-8885-2509b33dc78a@suse.com>
 <804a6d40-73a4-4af6-944b-95e9324d7429@rowland.harvard.edu>
 <Zqp8vbbIC8E/XrQY@embed-PC.myguest.virtualbox.org>
 <b35a344a-018b-44ae-975a-7767a3d5b6ec@rowland.harvard.edu>
 <f5d4711f-9b4a-457c-b68c-c2e9aefbe4a8@suse.com>
 <890e0ed1-25c3-414e-9e8e-f5925fe8c778@rowland.harvard.edu>
 <ZuI5nptdk+BcXh+R@embed-PC.myguest.virtualbox.org>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZuI5nptdk+BcXh+R@embed-PC.myguest.virtualbox.org>

On Thu, Sep 12, 2024 at 06:15:18AM +0530, Abhishek Tamboli wrote:
> Hi Alan,

> I noticed that the patch has not yet been pulled into linux-next, 
> even though it has been acked-by you for over a month. Is there 
> anything else I need to do on my end?

I don't know what the story is.  Greg?

Alan Stern
