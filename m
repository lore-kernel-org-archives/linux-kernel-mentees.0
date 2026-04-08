Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A42B23822BD
	for <linux-kernel-mentees@lists.linux.dev>; Wed,  8 Apr 2026 19:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775678392; cv=none; b=E1gDD9MXDf3k5dL8l4qzlLbc8WO2aNfUa4p8wArvlXVL/ODkIueadY+Pyid7F+2sO1Gn/uJ9kspnDjf8EGUJBGjCuWAoMNSaTQtZx1MhiQId3lOo/hXeQCU5x9mM8H9NFVJvJN4r1tqfv6mjP+hKpncF5rNrZYFxtj909R09NgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775678392; c=relaxed/simple;
	bh=FerRYkmJ4yyfdIttiwMEYgYR0TcFjIKcmhdnkB7SnrI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TE4HqaoyGRrIUjbpt15nKBx4Y3ROsxCjKserRZtKaavs3cAoSAZAiJS33gdxKeG0nN756YvT9Dh+Bssu3tYZXw1NUhl9xAMBIkgq9r60xAORTQc8R3wN74fxQflDn18k1JZMMM7I6CTwRFf25M3TJGcnJiSj3QsbLMg5UrNn6Bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BTL+ES+P; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BTL+ES+P"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-35d94f4ee36so137080a91.3
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 08 Apr 2026 12:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775678391; x=1776283191; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T62ak+RDMJ/ecbm+4TV9sT+dXCfZWT7fcpu5JcoxLqc=;
        b=BTL+ES+PEWHRQPn9xcSCydu6T8myzFNSbrAWuT6H0n1PZxjKTZqGjBAFPJw1FzsZMJ
         tcPk6eUjHGe8eOGwcPp8D7rOBJ6mNKQx6ieNkfBI44bFsWxvZhwpx6Z6NxeiKp5+1cue
         tyQY0MwjW3pbb4G5BYHYl9vXvHxtAMklvTR+aemdBvTUcZmVoshRGT5wqkvLyxlDUwuj
         G+wiXO+hrYN06a8/AstY/EgVQdIOAuDWrHwYgJjp8trES/aHuFNFei47hv1KwHNn3sxW
         0iBvfhqQxycwhHBxOALklV7uHNE/Km05HzlbFCCiplO4fkZrUXGE8Tp75jw2eGavozKX
         st+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775678391; x=1776283191;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T62ak+RDMJ/ecbm+4TV9sT+dXCfZWT7fcpu5JcoxLqc=;
        b=Cj5SBqTrjBItNffznAowWD88/wQM8kXWjveiNz//0UrQrpH3XTyR0c/i0EcH74ncv3
         Tw+E3/juB8ILrBJj3l1h3LtudDk12wCtDz5Fw4g9zTYAfQl2tdZzVCE12r1FveIY3Isw
         OYxpl4aWU9UBeHd4SKuWF5aph+KveVfZQ7X9mqdtHVTK4Ivwsno1GtdOC5atHaqGrSgz
         QuJTqzdn76i3YG2akdXtUNl1mQjegDRaSaEE6mdkutVXudwZXxyUHDc4HgsX/qbJ4qS8
         s8Kq+wubmfu1W6CqCeTNuY4kMXCXj3k14yGCx7bv5H4w4yDhLW1JLpxVdIwRQNf6Iqtg
         F2AQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4f0JEOkHsnWwJKA9/IBWGx1Ljkj2uraT+H25FckrpgUCwoMXbCDW9ZOycvrC1A4+6KWyGysMPqXoJzWBgNk9LbHmZYQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzOl5EoI58IRVZqJrjStmfNkIMUs5wQ6G8KXtj2G6WwoY9sZGQs
	+g7jE3pGrdj1BZNCgOUHnUdhJHHVWMuk5cP05RAnQagBcmzE0s1dQXVU
X-Gm-Gg: AeBDietnw8sYDIF8SqILPrIAH4uFSzefPxzHxJw6cjKZ08geaCh0axtntKDN6OTN9+W
	52cUZXGVku95uJwLipgXvfG9J6eTyd7FelN26gQh53M0Kb3L4JpB9e3kRoFwkWZM0xq7iHDVd1J
	iaiWwu7DR/yjb8cPvKGAarACHhb4fnYOwNuc/djYJQTsKGylXaCdHK58SqfAuLWBw+4GeT7nfQz
	ORjsBf/xmuA3GFiXuSvU9Q5+A2/7eE16i5cCccLHG4kaZomX7m5rR6cUFy+3X3Bkn80j5ji3NWC
	Ct+cKfUV5XWSQ9GEM30ZFAsi7FT8+KaFhhRyHO4vdx1E4ecoVbzmHValW+wT+7LXqBytFgNUR6D
	+U7JE8inI9s92x5aEwULqigxxFsaSSZqSteT0J8KxyVT7aTMYXidZnSL0yZL6ryD0Lb/EgC288X
	D00oDj5NX0iGPuv6vZUSO3mro=
X-Received: by 2002:a17:90b:2fcc:b0:35b:9d3b:34cb with SMTP id 98e67ed59e1d1-35e35774202mr599371a91.8.1775678391043;
        Wed, 08 Apr 2026 12:59:51 -0700 (PDT)
Received: from inspiron ([111.125.237.246])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35e35155829sm480190a91.13.2026.04.08.12.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 12:59:50 -0700 (PDT)
Date: Thu, 9 Apr 2026 01:29:40 +0530
From: Prithvi <activprithvi@gmail.com>
To: ethantidmore06@gmail.com, luka.gejak@linux.dev
Cc: gregkh@linuxfoundation.org, abrahamadekunle50@gmail.com,
	b9788213@gmail.com, straube.linux@gmail.com,
	andriy.shevchenko@linux.intel.com, dan.carpenter@linaro.org,
	weibu@redadmin.org, knavaneeth786@gmail.com,
	ignacio.pena87@gmail.com, dharanitharan725@gmail.com,
	samasth.norway.ananda@oracle.com, karanja99erick@gmail.com,
	s9430939@naver.com, suunj1331@gmail.com, ysinghcin@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com, khalid@kernel.org
Subject: Re: [RFT PATCH v3 0/5] staging: rtl8723bs: Code cleanup in
 drivers/staging/rtl8723bs
Message-ID: <20260408195940.m2nz4xaz6vdquda5@inspiron>
References: <20260405114132.310774-1-activprithvi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260405114132.310774-1-activprithvi@gmail.com>

Hi Ethan and Luka, 

Thanks for taking time to apply this patch series to staging-next; I 
apologize for it not being possible to apply this patch series. I just 
realised that I mistakenly was working on mainline kernel's staging 
directory rather than staging tree - probably thats the issue here...my 
bad

I will send a v4 patch series to rectify this issue. 

Thanks, 
Prithvi
