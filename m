Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5495B1E5B68
	for <linux-kernel-mentees@lists.linux.dev>; Thu,  4 Dec 2025 00:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764809534; cv=none; b=a+zxTAZYzJM52uLw+wUCTlq/Tf1yjUgPPz9xpojF0TITwbQUaa38Asj5EFZwZdtI3qHsLUKm1lsaQ5GT/JCudGpGxbOqgAZaef4f44OxxXks+vJEmyoW1ns9wWcs6f1bza/CE9XIGqen4ptRqGAYG4G8TiDT3Fl9KyVUClDLtVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764809534; c=relaxed/simple;
	bh=kEcCUKZDlgMs1iuz9lbnwuEeJ9PXjzHfOWYGEi87I0E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NjdlUHOYUse+vmvZoVl/bpkti3aBsSVCU4t1o6LFI8fSzn/v5OMLm2kH38xTkpisH+AlgCOYg8UVPpFljSUe0G5uFPYc5K9VQCvLQB4tnvN3aaT3Ag5TBFbkPivR6x8H0vEhLEBnEW57TnnxiOBB+TiNv0EZSVQQlppILfat9SU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xe1Qxgqr; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xe1Qxgqr"
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-55b22d3b39fso122332e0c.2
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 03 Dec 2025 16:52:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764809532; x=1765414332; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3atcAabCz2sjBHzquuqosDkAjLE72vWIxNsqZt+hnrU=;
        b=Xe1QxgqrvD2CanqPLUDf7C7C2pPAemUfLreBbu0gv/6ym99QFh+fkqMDj6DJssHT9t
         vEb0re6LQisRki7N8DV0yBnUgebCV+g6bL7QUrBvH54H+vRdRnNxfr94Ese53suIbKjo
         g3SS4wSFdUXTa+8zkmwdOxcb7dFvQjMn/1IzJ6Lc143w+wXGV/U2iScBRAI5CIrzkwqs
         RjlfYp4IsyEyEgH7vRnr1NPZYjXRBuyYQ2Cc8L9ErwvfA+a5+lKnL/QIDyCG6uWZrDD7
         /JxuNPpvpfotPpUtvNuRTfrL83+UAbrqWIUI9fbcfYCCUAaaRjPdX24cyKN9AHgV6Mx9
         6TUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764809532; x=1765414332;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3atcAabCz2sjBHzquuqosDkAjLE72vWIxNsqZt+hnrU=;
        b=USL0JKflI/kO7hEpAG5YrAi/e8IIwkgfMPL+FRYAYp9Zb1ciJIQhJzNAGmabFdtJBs
         L0zo/BNV3Mu0uLY42knaW01MA1LntJpnffir9r5l3KLUEVDvLqSpkaMROSA3KD4GeXDh
         DmeCmUazOL97v8o1kDl6dQs2Ed5ebnU9BHqIhkO+BRADCD3bNU7ooDkzEAzBhCfjjs8c
         ORs6ZakpjL627kzhLp85Y8G5citttGdIQykWJgMrjl+6+JamzN/yhye8EYfRIG564UIN
         JSW97nhGhxWWBTfEaqzv0QAANYhPh6FsiaT/wd9kDYqU67vxmCfGZKB4in+/QuuwJaNb
         n3uw==
X-Forwarded-Encrypted: i=1; AJvYcCX4cMofasVLw1TLKZQ8Q+bcm12Ow+YpgLxOswuW5B+lyOOpfMcY3ca2HiUrlYo0o7VMioLO0dNXGOfhg6qIpOCBgnnvOg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+QXX2756Do/b+8jrS5Y8FKDvPKoFrjnY7tJMIBGK6DETcMWK+
	qULSXoaPH585aDuh3Pp+eAwdiZG1hpvAgpynNh+V4ch4VpYDrbWOijOQ
X-Gm-Gg: ASbGnctPnNkxPJfXI73tJlOwldzsfOrnPBmoQ/bUrlsTMoEBovPevyg1cfir7qeXoyM
	/XkRgxGUxAEfQAanqTtueinIBmcxSDGbK3qGs57HP9IKgc+NWHSx4zDk+zYDu93aUgHUTh3Pzvi
	G2nQmImJDw0r5fwCACork2ramIr/hpATD85Fc2D3nFq+3H4XUcGvfrv/buLVzoyqgW6xNGp4/78
	oBhQSIk6FQKWzyQxjbUQZvFFdypMI2I7VEYjye7GRsJiaI1Q2/Hq+I/br6498fhjCUVNRgFRhoR
	CVXnhAxJcmWWEZexVN+w8Zs/RZ5DXFjn0TMSPVM+or5qVgRiUOkfNefRb2gPrSC7IQl1WqsLJLV
	faQgyKDZpzjQTq9+z6Ur16iQOkZzQsHBNrVBwjKwjgqtZQWbTi8HCTx+HWPJcgW2fOLXjpUyFCG
	tZqrT5jJKIhTvDEWtpUTq4W5ui1eZiD2w9WEK/+h8=
X-Google-Smtp-Source: AGHT+IEMpcuJ1gIWyXFsLaW+WfiWQoJCvzkx4F9QSwvAIrW2J9InZ7o7A7DWxduc3pOViRobrHz0JQ==
X-Received: by 2002:a05:6122:45a7:b0:55e:4bcb:6bca with SMTP id 71dfb90a1353d-55e5bf4e28dmr1544588e0c.10.1764809532071;
        Wed, 03 Dec 2025 16:52:12 -0800 (PST)
Received: from [172.16.226.146] ([98.254.184.207])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55e6c938d9bsm58015e0c.14.2025.12.03.16.52.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Dec 2025 16:52:11 -0800 (PST)
Message-ID: <a953d014-40da-4618-af71-492f84626d94@gmail.com>
Date: Wed, 3 Dec 2025 19:52:09 -0500
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] usb: gadget: dummy_hcd: coding style improvements
To: Alan Stern <stern@rowland.harvard.edu>,
 Greg KH <gregkh@linuxfoundation.org>
Cc: Clint George <clintbgeorge@gmail.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev,
 skhan@linuxfoundation.org, khalid@kernel.org
References: <20251119130840.14309-1-clintbgeorge@gmail.com>
 <20251201203715.17768-1-clintbgeorge@gmail.com>
 <2025120200-backslid-endocrine-e64d@gregkh>
 <17845408-4a9c-470d-8949-f4cd0a847615@rowland.harvard.edu>
Content-Language: en-US
From: David Hunter <david.hunter.linux@gmail.com>
In-Reply-To: <17845408-4a9c-470d-8949-f4cd0a847615@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/2/25 10:53, Alan Stern wrote:
> On Tue, Dec 02, 2025 at 06:27:46AM +0100, Greg KH wrote:
>> On Tue, Dec 02, 2025 at 02:07:09AM +0530, Clint George wrote:
>>> As part of my LKMP mentorship i have to complete 5 patches as a criteria
>>> for graduation and thus have focused on working on such
>>> beginner-friendly patches so that not only do i get the required number
>>> of patches but also get familiar with the process of kernel
>>> developement.
>>
>> The LKMP internship should be done in drivers/staging/ as generally
>> coding style cleanups are NOT accepted in other parts of the kernel,
>> unless you get approval from the maintainer ahead of time.
>>
>> Does the maintainer of this driver want this to be used for the intern
>> project?
> 
> In fact, Clint's changes are small and inoffensive enough, I wouldn't 
> mind having them applied to dummy-hcd.
> 
> However, Greg is perfectly right that this kind of stylistic update is 
> not something that should be submitted for most parts of the kernel.  It 
> just bulks up the Git history with essentially meaningless cruft, making 
> it all that much harder to see the changes that really matter.  That's 
> part of the reason for the suggestion that interns and beginners should 
> confine their efforts to drivers/staging.
> 
> Also, remember that trivial changes like this are fine for learning the 
> procedure of submitting kernel patches, but the effects they have on the 
> kernel itself are minimal.  A patch that actually fixes a bug or adds a 
> functional enhancement would be a different story.
> 
> Alan Stern


Understood.

David Hunter
