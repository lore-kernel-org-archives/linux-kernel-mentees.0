Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 491FA3B184
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 11 Dec 2023 12:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UbmbzrBv"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE7D0418FF
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 11 Dec 2023 12:20:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE7D0418FF
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=UbmbzrBv
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GTwpMXkvg0hp
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Mon, 11 Dec 2023 12:20:22 +0000 (UTC)
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
	by smtp4.osuosl.org (Postfix) with ESMTPS id D7284404E7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 11 Dec 2023 12:20:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D7284404E7
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-6cea1522303so2647738b3a.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 11 Dec 2023 04:20:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702297222; x=1702902022; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vHNc2iZRlEJ/g06n4SjPSJU8dGxpln3/T5FnwmRNBng=;
        b=UbmbzrBvZ4ur9csoB2RFsRUujyV/n+fQhUn80H0gpi4p45Qr08qBU+OnHxrdDUnfIG
         A+Wj4Ie/fsDPtjX7uvPoY/w+EdqSPgfK+cFQLhB/pF6/kK8AbyFK6dJVwLEhC/aX0Q2B
         SSwE1Y8DmYgGXcUSQUJasE3txH+XGjHCPv90oISov3q715O+soYHHrmz5Lboct+BOKYH
         tHjb7RlIYPON7iJXF7qoFEWu042O8w6gRETzs/mdOffvLt6NisKGGeVQXvY73lo9t1Vy
         Sy7MM5MOT13WIlVIQPlEmW5Fmx1T2+d9AxvN74Ykrwvuz1yBaGyAECM6g+XZhWibinW7
         60ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702297222; x=1702902022;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vHNc2iZRlEJ/g06n4SjPSJU8dGxpln3/T5FnwmRNBng=;
        b=Kz2PmwiAVea4XKVqRzKB7ziQOsKM1IQbamrW9Hk6T8FYgu2CqTSkSuKJMVyheOQE/B
         lGyqYboJ2n9Z7zsCr7QwqK6abHvoHrirx4V0bH3omQtG+Hw9jZ3koAFz5wfYSs8z7y63
         FnclGBUAKmL4JnsWcjvl7VtzBsR8JJectCA2okJvhMSwwMDKjO675B92+3GJjXl4KJnO
         nK1JZsRZ8PcwRhNQDdSvc10f2ipnUasL+ziKCA3NHU3rKmMkQhQNTxgZVamwYWHTBUgB
         PC0aXbmIOqMFdRJ2B5SrfXuWZTy8St7gaI3e814JVoYwVnB2X0oRTTXHm1o1V4qhjsUe
         SyIw==
X-Gm-Message-State: AOJu0Yx0cs+c4wKbVazCmcvu0UmRkq9QEmYmL81ePejAvdNFn3/F6yOh
	1TVL00Nc0N7UMC0utrsKpfw=
X-Google-Smtp-Source: AGHT+IHDDnDuhytKPqmRZYK9u+TGoPLU3H6E0QcxKDEiUTjmLl5CyKvnSi7DxMo4A3FEwKlMOfOtbQ==
X-Received: by 2002:a05:6a00:6004:b0:6ce:f65b:a6ef with SMTP id fo4-20020a056a00600400b006cef65ba6efmr1004974pfb.12.1702297222176;
        Mon, 11 Dec 2023 04:20:22 -0800 (PST)
Received: from swarup-virtual-machine ([171.76.80.2])
        by smtp.gmail.com with ESMTPSA id b8-20020aa78108000000b006ce7bd009c0sm6342198pfi.149.2023.12.11.04.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 04:20:21 -0800 (PST)
Date: Mon, 11 Dec 2023 17:50:13 +0530
From: swarup <swarupkotikalapudi@gmail.com>
To: Jiri Pirko <jiri@resnulli.us>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, netdev@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH net-next v6] netlink: specs: devlink: add some(not all)
 missing attributes in devlink.yaml
Message-ID: <ZXb+fRawVUgU+lrX@swarup-virtual-machine>
References: <20231208182515.1206616-1-swarupkotikalapudi@gmail.com>
 <ZXbaauFOfttLCe78@nanopsycho>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZXbaauFOfttLCe78@nanopsycho>

esOn Mon, Dec 11, 2023 at 10:46:18AM +0100, Jiri Pirko wrote:
> Fri, Dec 08, 2023 at 07:25:15PM CET, swarupkotikalapudi@gmail.com wrote:
> >Add some missing(not all) attributes in devlink.yaml.
> >
> >Signed-off-by: Swarup Laxman Kotiaklapudi <swarupkotikalapudi@gmail.com>
> >Suggested-by: Jiri Pirko <jiri@resnulli.us>
> >---
> >V6:
> >  - Fix review comments
> 
> Would be nice to list what changes you actually did.
> 
> Nevertheless, patch looks fine to me.
> 
> Reviewed-by: Jiri Pirko <jiri@nvidia.com>

Hi Jiri,

Do you mean in the commit message, i should have listed all the changes?
Please clarify, if required i update the commit message.

Thanks,
Swarup
