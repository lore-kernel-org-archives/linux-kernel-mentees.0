Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7007C29B8F8
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 17 Aug 2025 17:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755450257; cv=none; b=B3lfVVu9bLnMKJOFP2BDLdgx6L/NXtRElHyVICe9VOJUwd9LRdFJZPzBhSoCPfS72It7ySP6tmXJr4L+0JSbjhem/TD2DPDdJCxJfJRO5QDiRI9/ymZIuNVqFqSMJ0dOoU49Ihc+Zm6GtSPGwNbk+cBu27f6x/0ZbR6pOkEeadY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755450257; c=relaxed/simple;
	bh=yMiSu8+CwATNqA0jqeNPP2G+Vuy2X0Hp59x65+/AEpg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZSnhO6hLpVuZWnpZa4EROvVGaCjusm5+eMN5C9fywGb+O5V5494c7L1OT3xoCjPSFAbE2xxdu8WIVSIWXk+BYJcZUw/+5PSNjFNc3F0uXriC0w5WxK7EYWj9DRorFnTDW0tv6EJvtO6jBSZyEc0td4apj7WNI1D+UclL7P7RPSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=AKBcMRGF; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="AKBcMRGF"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE77684436
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 17 Aug 2025 17:04:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 108QYlsP42rB for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 17 Aug 2025 17:04:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::82a; helo=mail-qt1-x82a.google.com; envelope-from=gourry@gourry.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 14C7884435
Authentication-Results: smtp1.osuosl.org; dmarc=none (p=none dis=none) header.from=gourry.net
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 14C7884435
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=AKBcMRGF
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com [IPv6:2607:f8b0:4864:20::82a])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 14C7884435
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 17 Aug 2025 17:04:14 +0000 (UTC)
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-4b134f1c451so7254101cf.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 17 Aug 2025 10:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1755450253; x=1756055053; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LTY1FVq5WoDfZQCECYiNgPIc5/Dv8Hx0SVT+yGcGAKw=;
        b=AKBcMRGFUqlNalxoAPnd+OGfhaMSUVfw5B+tENE4qLeE3MopI2DNYu0sIsXCq4qMgL
         l6vCk4mgXuesXw03+DTEIrY0+3cPp783vvTP1T3CvcFqwQySWjI9IhghHgtPjGyUZs0C
         nqTlCcvetCvFVAqkIvUQPnm6+l4un3LzDjsg2zQKUWbCakRAK1ZOPv3rxsbcrxqwuEzX
         hSBNz/1EhCUDLu1s3nuImRTXkF5QI6I8T+mHfIkgs9yZfCzh/G9S6PdNwqKSDpyFy2Aq
         h54waodVbVZDBSGprmAsOZuTsgwYhYHACnh6u6nAFl4A4SZQ33K/H56wM6xduJIBUqZD
         Rp1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755450253; x=1756055053;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LTY1FVq5WoDfZQCECYiNgPIc5/Dv8Hx0SVT+yGcGAKw=;
        b=f4bjwEItMHjBbuUJvrSUoEEEoiq+cWk7wYiYWtQ+3ivUDK+EEQIfW7lzU821cyNFSB
         5KA8wZuDONbKOHRX/MgPKPx+Pz9RPibXP06efI2MmuoxKlP8Z8IDW3YiGPM0KB55oKhv
         3elc4HI9ukI1xw9peCV83AZjQcpvTDlLpRQOB9+JlGDnZLtSYzny+cmGaQhn0NMerTwU
         FoviL0b25IRN+LX6aTmXaQ0q7OGy77dsbkiWYPB9HuI2l3nrX18+zrL7rbJwbp66WeeW
         +g0kIVYsty9HQslRE8ZTQGFIYVr5r6Eof9g/LbMWrXgbGHh38nfpEIeURCG8QEIxxVtX
         aSXw==
X-Forwarded-Encrypted: i=1; AJvYcCXjwR8x6kMLNS43nUXvpbHaMETFSon/WaclyzIG019KG7r5DmprQ8X+XjymACAyz2U26MTkEX8wgOvLTkIw34n8opDhxg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzHNdV4bEpImmhp9b5JN+hFTazkHY2pt66BXDV9bihaznNFYqBt
	vgXqXTtMuIMI3ocwePZx42LpQDqe16RG0v49dtxp4C+i7izcpAFa9xmzOcWle18EMfM=
X-Gm-Gg: ASbGncsT0wffcyMVGwc4HfxvWo/Fqx0keLuCkEmfrHrK48Bi/1fs5mG/Fs1itFiWMQy
	mK89o2dQyJj9WBMEB4mvAXCE/OBVZkImipVxyAhdg3iFEyJdQF4hvOYtYk7EmsJ64e9dqC+1dE3
	L2mbI8pql1Pn8/5MuH+PAlDxPKzophh5DSnKfjs0pMnAKYbBBCTPNNtnhP36hBhUl8JEB5vW0Oz
	MXtNMIzcGY9gXbXkPh8hQpZOYM13cDgl4NE/N6cCKy7rZRI9kyX5qs/BASyZ5Wifx7JvDm3rv/e
	sFigotvUWL19/5+F5alzpCKcuO9HMW7wcj13DRePm7232aTYWqPicKD74rZ+mOTuWMjss9cf952
	5GhVxT7jkDX1Z1oFNggHpTkFvSwhd1YXUaA2A1+ZmxkBW6TORhs2Hk9Ua
X-Google-Smtp-Source: AGHT+IHx+kOBv3NDxYTEUEXjNrbq1sQssAeYaYPTpf57jYhOiKKX1UR6U/rAq+fbGEMsJYFLovCD6Q==
X-Received: by 2002:a05:622a:5445:b0:4af:7eb:f4a0 with SMTP id d75a77b69052e-4b1336ee522mr38590451cf.19.1755450253523;
        Sun, 17 Aug 2025 10:04:13 -0700 (PDT)
Received: from fedora (pool-96-255-20-42.washdc.ftas.verizon.net. [96.255.20.42])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b11dddb0e9sm39210241cf.32.2025.08.17.10.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 10:04:12 -0700 (PDT)
Date: Sun, 17 Aug 2025 13:04:10 -0400
From: Gregory Price <gourry@gourry.net>
To: rakuram <rakuram.e96@gmail.com>
Cc: linux-doc@vger.kernel.org, dan.j.williams@intel.com, dave@stgolabs.net,
	dave.jiang@intel.com, jonathan.cameron@huawei.com,
	vishal.l.verma@intel.com, ira.weiny@intel.com,
	linux-cxl@vger.kernel.org, alison.schofield@intel.com,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org, corbet@lwn.net
Subject: Re: [PATCH] Documentation/driver-api: Fix typo error in cxl
Message-ID: <aKILiuYaijqAZvPR@fedora>
References: <20250816183034.7970-1-rakuram.e96@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250816183034.7970-1-rakuram.e96@gmail.com>

On Sun, Aug 17, 2025 at 12:00:33AM +0530, rakuram wrote:
> diff --git a/Documentation/driver-api/cxl/allocation/page-allocator.rst b/Documentation/driver-api/cxl/allocation/page-allocator.rst
> index 7b8fe1b8d5bb..4ac3368c3947 100644
> --- a/Documentation/driver-api/cxl/allocation/page-allocator.rst
> +++ b/Documentation/driver-api/cxl/allocation/page-allocator.rst
> @@ -62,7 +62,7 @@ Because the local node does not have :code:`ZONE_MOVABLE`, the CXL node is
>  functionally unreachable for direct allocation.  As a result, the only way
>  for CXL capacity to be used is via `demotion` in the reclaim path.
>  
> -This configuration also means that if the DRAM ndoe has :code:`ZONE_MOVABLE`
> +This configuration also means that if the DRAM node has :code:`ZONE_MOVABLE`
>  capacity - when that capacity is depleted, the page allocator will actually
>  prefer CXL :code:`ZONE_MOVABLE` pages over DRAM :code:`ZONE_NORMAL` pages.
>

I have since discovered that this area of documentation is incorrect,
and this behavior is the result of bad reclaim logic.  I will rewrite
this area shortly.


Just drop the page-allocator.rst chunk please.

Reviewed-by: Gregory Price <gourry@gourry.net>

~Gregory
