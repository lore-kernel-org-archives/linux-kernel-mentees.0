Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD6D3D969
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 10 Aug 2024 20:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723321368; cv=none; b=KhNGwtFH7ZKcIvQ31j9oVgatSOHcvESe1WQpGAKpgqZtZeooD4WIuAde7M3sqd7lRyKcD50YA4lA8lB3TbJOoDRTiQVN/n1/EwpMnIvhL8SBVqL/xN36KigW+RpD2w1J/SjQt6/dSfEAjbJwh6aNKLY0dsEbCTFcsqfeDsVOh2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723321368; c=relaxed/simple;
	bh=/j89L6KYe6L4J70i8v/7BBv1Mtrp3axIEBNw1CLOiag=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K0tBAgrDGp17gRXZ74IS/vIVagO9MCUwIw4XlaNfD2EOOpqoL3qfrNGRfn54Xy6K1KLJinoNG9+sdkE1MFmBFkFtEybU9Llm4EGGQ72jGBgczFeIGMP+Fs1cILc/Si9OerkSE21/dNqO/hdNIY6i3lOJw9yl73TrxEq0Q16lo2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V741OfFG; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V741OfFG"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4281ddd3ae8so527825e9.2
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 10 Aug 2024 13:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723321365; x=1723926165; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1WJSTsrRx4oJOBIrrFDvG+VDw/7Lzat/H74w3iZbcYY=;
        b=V741OfFGbNGDNoC33gTEuQB/aE84CsgiHOp9IhPDdLz0LQtDG7bdgqlr6po4vb1WUy
         52VHyr22SrhiYl5gIjYzCwJLrwTmEC+KCfG9iNUkpDoabI8fdbVbxQ0sJPr76YQ5MiUz
         CHodY8W5oMLuL5OkGhwYb69vHKuPIHs9XStlnPosGVBNaoJmrzuyJrNVXeXAd8zRSPch
         MlOwE00COKz14xYSASmCIuKey6lVsBaM5JyXItvH+o1gIHcw95JkjCiWdE6bS5/D2oZ7
         URA+FAP2kunmfW76uLpwnRzcdzu6kObdw80ywxWdIP1gRuTRt/RCa5EGrj0/NLxJiu3C
         40NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723321365; x=1723926165;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1WJSTsrRx4oJOBIrrFDvG+VDw/7Lzat/H74w3iZbcYY=;
        b=LFAUwaLl5OIdkv+OAeQ98uipeIIkH5HMzBuznHxDM5QuLaqF0LNeMJtrYXbr2OUwTT
         JPouEjb9lStP0vttPw4T0agkh/OZ48BZlx91UxYE5uOYGqS79xypnAXIHUwBuczNgItZ
         +6AnUbqLatgEFGAAP/ctEuxqbp1hFPq2c9l6dKognOfaVZlmT7ISdOisOn1DBQ4P36ez
         Q5IXDe8pfsN7GXg6PRNxurilf6WvC6McCwnPeqXbfvNnlC3G+xgZnwPuLVqYTgUQSKp2
         rOg8FdF4aiXVxbumge2ECLxU/0wXa38OC8Er7qhK/e+gil9aUeUvoGdD3eCi5Ph9l4Xq
         n99w==
X-Gm-Message-State: AOJu0YzWbbw65XB1UticpweTYq4Lllv4S/FatTSuK11DkX8r08bdw0JF
	VvRVidajapK4tUU2vm064k1V9Mt/0KedZ0emP59WFvgyUJobSyC9
X-Google-Smtp-Source: AGHT+IEFvhofB7r3PhdUBPxijlHgCD185WeOwLiwycpKBfUT6KYKDMx2W/FJx+S6yBZiVtGR8cfehQ==
X-Received: by 2002:a05:600c:3ca4:b0:426:6fc0:5910 with SMTP id 5b1f17b1804b1-429c3a22819mr23707355e9.1.1723321364976;
        Sat, 10 Aug 2024 13:22:44 -0700 (PDT)
Received: from ?IPV6:2a01:4b00:d20e:7300:5ef1:c6e:2781:5ec2? ([2a01:4b00:d20e:7300:5ef1:c6e:2781:5ec2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36e4ebd33ffsm3198299f8f.99.2024.08.10.13.22.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Aug 2024 13:22:44 -0700 (PDT)
Message-ID: <13beb34b-3ff7-4b88-876f-0a7f65254970@gmail.com>
Date: Sat, 10 Aug 2024 21:22:43 +0100
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation: Fix spelling mistakes
To: Amit Vadhavana <av2082000@gmail.com>, linux-doc@vger.kernel.org,
 ricardo@marliere.net
Cc: linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org,
 amelie.delaunay@foss.st.com, corbet@lwn.net, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, catalin.marinas@arm.com, will@kernel.org,
 mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
 naveen@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
 bhelgaas@google.com, conor.dooley@microchip.com, costa.shul@redhat.com,
 dmaengine@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, workflows@vger.kernel.org
References: <20240810183238.34481-1-av2082000@gmail.com>
Content-Language: en-US
From: Ivan Orlov <ivan.orlov0322@gmail.com>
In-Reply-To: <20240810183238.34481-1-av2082000@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/10/24 19:32, Amit Vadhavana wrote:
> Corrected spelling mistakes in the documentation to improve readability.
> 

Hi Amit,

Since this patch contains changes for multiple files from different 
subsystems, it should be divided into file-specific changes (so you have 
one patch per updated file).

-- 
Kind regards,
Ivan Orlov
