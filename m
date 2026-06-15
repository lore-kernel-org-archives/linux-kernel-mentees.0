Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F5383D1CD0
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 15 Jun 2026 09:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781514648; cv=none; b=kIGpSsDE0lPnWKt1wMAH/nLjGGyoJMbLuBJdeg+0Esux2aqg5XPsHy4+iyAnP2i3GOF19gfZoeHlMa4norXLU8kmv7poAJVG0XQduKjs0RzRgZ5CyWmrjAheKqXkA99NiUIYEoEEUYUMcXRjwgMMkJ0b8GUvuz3aCwqhw2sOQYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781514648; c=relaxed/simple;
	bh=C61Nk63JjswpbH2JNRjVNNoaYKM311GzvhFjl2oj6GY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D8X907QnYadtFOGzRwC5u14y9WGJWe7oOlakRQK86J/rx1EUwiAbthZejDhY92YpL+IfUQvaz0mIklHNJzzrH7nMs2X5yfHmxUEXX82+l1goRQBpVXqOFlQY2Mg33NitVhAKJ/ZI7Mzn16WHb/w/DWqOxrPGbAAUfgfAlDZ2jt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RKSDk0Zy; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RKSDk0Zy"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D3C858225B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 15 Jun 2026 09:10:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LFZDCKNmmp9K for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Jun 2026 09:10:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::f29; helo=mail-qv1-xf29.google.com; envelope-from=error27@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 24E7F811F5
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 24E7F811F5
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RKSDk0Zy
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com [IPv6:2607:f8b0:4864:20::f29])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 24E7F811F5
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 15 Jun 2026 09:10:45 +0000 (UTC)
Received: by mail-qv1-xf29.google.com with SMTP id 6a1803df08f44-8cce87d7995so36108666d6.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 15 Jun 2026 02:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781514645; x=1782119445; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3ulnDM8eeKV61SQBMzpbZyZzQXY9+u4yz3z/HPp2h60=;
        b=RKSDk0ZybVVc9FIzPsos1GT+YQjdsTe7O010txuj2ehpP0sDppLKrYugoK5rkq6BPj
         nk183hiSpvzGiQP2vQYfILKqKCA0+J+ByuLV4H94wJD35MPO2pZTitzKsu1N3h3dVk9d
         CojlIXU/g7595VOmAK2Q9EQCXT3kgj7MzeIxAw3lJ844gTNID0VcXxBRJod7BOhuxAS7
         0lDzAGFH+g0v9Q1zIU7aJUmJhBcwNfPkKwyBu7j6QhAQpbAk8JMKtKYBWPyC3+Zeoyeh
         hcIhbxwH8f+6O+7Sc4AfGAgTKWEYbhBiz9WAJosT2X4D6ksPGDAb/66TqEWsMsLv3ph7
         gAqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781514645; x=1782119445;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3ulnDM8eeKV61SQBMzpbZyZzQXY9+u4yz3z/HPp2h60=;
        b=sjBRO/ZdwU67r0RbdY5yl6rQtgPjigsZwwelGf3Y8jn0+dDHU0M4ePxEHXrAOKp7Ec
         26a4qtq58ZJ3069T4khl0BIjx/fhc0RO2osVoa9CmVHRbv7jTtgTYKKEWDuapWP398wA
         UdUYhz2Jv8CYF+FJwOJSFcNMx+jdODO8sg1V1PQ478IDkMC0woeKCPKrUnSZyZBOqxfJ
         K8hTlOAE6IoFwHPHYLD2MlDTihn16C4i6Ug2lB8Ye/76HA8+1mYQPW14++ec5N79q6l9
         BO75n5xnhsUVqh3EIMnxLQq87p+i0GAU5TGDmidhVgwGrO1HV99s4WwvrFSPb789+BiO
         Z6kw==
X-Forwarded-Encrypted: i=1; AFNElJ8x1VKrkUyETQqukWXkirC+qTdEXyOwvo1H6iTWZiFTkhvsae0+BVSTkDacR/bWw/2ZvH2ovKBOBE0K3+bmf00fINFAzw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzNX5qGPjTtFlhkMK2WSncZUxl5swnXGRz6H9kX5bAy2F4eLThl
	MCHLZsswGTOhuREjnw7etcY8YGinOdFpq59CKUsREsADdtCkqzdYcvsU
X-Gm-Gg: Acq92OGdO2Aw4yUap7nX8rI8J05kCNdgZPdD0K1b5/bm5i8RCb/ARZgoz6zMiiIUgPw
	O7V6cBWuiWrB6dkOivkoeCJYPc9HGuTALUhONJmMzRdiiP0yHoq2+A3kuCqpYOX/Dj4v1eXtfaO
	l1Mqhb4e3W3j3//EEo2ozBamt2o5FMBtFmQ7wQLJGrsqxmfsARwyqc0tJX85VX6/EKYmqNPbX74
	W9FLBPa7LGlWsjjRWNkQDc5ZdNOzybDx0OthyVkKjpoyfFGfe2iwzUvDB4aI4FUuGKUK7GQIfZG
	Um3cnwHmZS+w3FlhQ5Fb1v51ZjXiO73CA83xhSi+Q6Q//QxSflOZRpcNeWA3mtMLvPb/lRaOEru
	jHg4Gizx9jF56O00gMgnkOMopijuRcsewLnfc8PPN6OhV5AQvJ4AXeSZB7M11Vnw0aAY9dazKav
	qjWr3zGcDxwleqBE4T
X-Received: by 2002:a05:6214:624:b0:8ca:23b1:f4a9 with SMTP id 6a1803df08f44-8d32c012b44mr213414426d6.2.1781514644732;
        Mon, 15 Jun 2026 02:10:44 -0700 (PDT)
Received: from localhost ([43.225.189.75])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8d301b271e7sm110094076d6.14.2026.06.15.02.10.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 02:10:44 -0700 (PDT)
Date: Mon, 15 Jun 2026 12:10:37 +0300
From: Dan Carpenter <error27@gmail.com>
To: Ayush Mukkanwar <ayushmukkanwar@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org
Subject: Re: [PATCH 1/2] staging: octeon: add missing tasklet_kill in
 cvm_oct_tx_shutdown
Message-ID: <ai_BjUJ5sJGJgtyd@stanley.mountain>
References: <20260614114739.87061-1-ayushmukkanwar@gmail.com>
 <ai-1ZsF3dzqXZcbJ@stanley.mountain>
 <CABJ81biRz2J7AJbo8xZ9TbmwAT8E7x0kdQP4-W2e3XZ729qWRQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABJ81biRz2J7AJbo8xZ9TbmwAT8E7x0kdQP4-W2e3XZ729qWRQ@mail.gmail.com>

On Mon, Jun 15, 2026 at 02:38:53PM +0530, Ayush Mukkanwar wrote:
> Thanks for the feedback, Dan.
> Sashiko found these existing bugs in the octeon driver when it
> reviewed my older patches on octeon.
> I will include the required details in the next version of the patch.

Thanks, this is really useful information.  In that case, you need
a Reported-by tag an a link to the Sashiko report.

regards,
dan carpenter

