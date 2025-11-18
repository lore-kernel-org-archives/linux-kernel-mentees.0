Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A683570AB
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 18 Nov 2025 16:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763485017; cv=none; b=tDmYF5vdfLqkhmmr0mqoMtz1JcES+24pxms7E+ytj1fe8Mu816DqkTWSnxDpVVH/xt1IvgnJb9lQEdTlnU4lDJihdPH0+vD0Ll+iy3cEwceAWCfJgmPdcIt9GpNmBUfQ8g92MOQtg1YTH7F6NdpIbS02Uqgru768ufamMzdbLqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763485017; c=relaxed/simple;
	bh=5V7GiE6xtZks7l89G9tTxWFWQSrdthsihabtJ0mENe4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b5OyHUAlpalFhhe/V2wvIO8MSzlx7F2a7STPgSdzzf7cCuiOL9dUr3EePjkr/GWlHWnBk/bSjPKj4l0S62I+HFWe5yBRxuJLkTZG2JwKetA1HGDBYPUpNQNtMFQAlFNXr8jsEcu2Yc9DF7ber3ikCAIdPSe09/VxqBd8IjlTRoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CnmcS8jy; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CnmcS8jy"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-640b0639dabso10065069a12.3
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 18 Nov 2025 08:56:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763485015; x=1764089815; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5V7GiE6xtZks7l89G9tTxWFWQSrdthsihabtJ0mENe4=;
        b=CnmcS8jystbFxNMa+AA54gjtHQ+7Kj2lav4XCDTfF9+Yfy+HWe4NFcUrggfzuT4YFF
         R72olL4vjUNjQy8jRLWahHT9hozGwmjNYRTeZ8KvOK8Kj/r5efTqhTSiBDnPNqJR0+LG
         n7UoEBBo9HGlC9rS14/vj0sq0GbyYqR1JwiYA0h7PS++p4lvyy8oWOe8QBTKQDufjA3o
         oMiO9eZjoCB20vAj8Nmaq95Z8RFOkpwwHszY2lOZPdRl6JZfH9sy0xEaQwJ5MYd5m8ic
         4pVW61A4S+EdO3xkYfw6PaNJERbQMSGGxXRCtt2N5/BqvuoFwkY/+PpwyWW/hqWEJ9/e
         PTig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763485015; x=1764089815;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5V7GiE6xtZks7l89G9tTxWFWQSrdthsihabtJ0mENe4=;
        b=L+BjAVDzudfASbBWem4Vfc39pc/h7vZ3khy02OG1XSDME2MXlCPh6W8ZnYcT2dyZUL
         bq1M4m/Tp5sqzKmuizErpv1JlxvRFeYQQIVU0JQraLl8Imt+UrZlUatMbZyctzCkIche
         4N6Njtei9s2zujIy0bVZQCIP2ug2yku/1gYAq9PdIVx8KN3etC+VU0OVdOPxssKYWzAU
         Fe/YUM18U9yRDE/OFWYpNzYX51Gy5msMN1yR7ldzupZz2ZC9CN97ec/k6BtG5UBe0gym
         mgQjaNTl5AGL7bfHttwnIt7BgYCYiARGQVKcvZfXeRuRCM5I+v8SJd79h4jflZ86uXyX
         dgXg==
X-Forwarded-Encrypted: i=1; AJvYcCU9Mi0I7WtUSAkIuD9dUn6KcJwiQ16IEfzYU7aVRknJ8OVqP1xwmpaR+xWIEGDWcibepFdg++0gIPL68d0lrJiF75PZWg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzfYvmRDT1dxiRjdOgkfO7VI5AvbbkaNyQEFw+VVbb7nVleseTi
	MKlI+uiV1K9PcFYPOOOYhtppWcs3hRZca+H4OFh91c4xglaEeqWKIWp40xFvr97WC61+V77DRKK
	JQ7vz0MLdZYvLfXmfVxe1LIjr1+ZR/BA=
X-Gm-Gg: ASbGncuDQZzud6tL8ZG+o82Jxu4h9vBLqimZL+RY82lkXmwWw0+Kk1dc482O17n1CKi
	uEVHFhXwisxKKeunheMXqsFI91z8HiJJQz/X7iAFkpLAw71rqGkoUn4oil2exv5qgHK9QqAb6rU
	hT47/AEkcsrmbP37kNzBCw0HTdLDT2qP7m47HpjhhRwegq0k+AbnVXEX14EoqC+Xdh2j47w2qPm
	lL5i41aT+AU71P6cgzBOfIoPrv5aKNEex5WkSfv0RTSzAw2O3ZgHzH5mKbHBHKXMOvSWCeWUq5K
	L09oOFw=
X-Google-Smtp-Source: AGHT+IFs1ML/yGQuC8YS4/Iv0wOMlGo1jVem3rfZFTTCm2g0aNVw9IUXkatjMzTKAnormtovEcs5dn1ta7eT+xhuG8Q=
X-Received: by 2002:a05:6402:2111:b0:641:3d64:b120 with SMTP id
 4fb4d7f45d1cf-64350e89f50mr14361293a12.18.1763485014376; Tue, 18 Nov 2025
 08:56:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251118164333.24842-1-viswanathiyyappan@gmail.com>
In-Reply-To: <20251118164333.24842-1-viswanathiyyappan@gmail.com>
From: I Viswanath <viswanathiyyappan@gmail.com>
Date: Tue, 18 Nov 2025 22:26:42 +0530
X-Gm-Features: AWmQ_bl01hvmKDelrUqTiwPIOlLTUnTAKXqeUslzZwhDZ8PPWJwRB4NxkgNyhqM
Message-ID: <CAPrAcgNSqdo_d2WWG25YBDjFzsE6RR63CBLs9aMwXd8DGiKRew@mail.gmail.com>
Subject: Re: [RFT net-next v4 0/2] net: Split ndo_set_rx_mode into snapshot
 and deferred write
To: kuba@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@google.com, pabeni@redhat.com, horms@kernel.org, mst@redhat.com, 
	jasowang@redhat.com, xuanzhuo@linux.alibaba.com, eperezma@redhat.com, 
	sdf@fomichev.me, kuniyu@google.com, skhawaja@google.com, 
	aleksander.lobakin@intel.com
Cc: virtualization@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi,

I am sorry that it is broken. I will submit a v5 as soon as possible
