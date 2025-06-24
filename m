Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE3A22A7E5
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 24 Jun 2025 11:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750764115; cv=pass; b=i7TPe59+zENJj9/psQgM/AD4+00zxrDE6IyrN4v+Z9o/IpjmaEwOuQkGIvv4rQKX9z+qGBPWeYwJ8qV1VjU3WMKPitbF7XZd3t5eCPKJzxy3tnBtZzT6yetQvvP8C2ijL8HULA49xd4DYRf8UEbe3J3bwws7MXQgPDTH/c8C6EI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750764115; c=relaxed/simple;
	bh=Q4e0cxZPvwB/jU7+RlQ7/Pfqg4bJEzPH4mWOGdAP3zU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O3qzObc2yf0nFXVADGV3sFVnK2LjHTzN0a/WNqYiL9aqqw90vTFuo1HVPfNtHEZIi9vz1yWHSHjQVDdonpUltWwDym9gy7DKNQrLrC5zH6zB3uWQ6hgIVSgt7zi2kZ0MzORJtKz0H9CUoRWMRSWg0oLM/5u3KlLCiY+lvTOrGiw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=W9iv1j2v; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="W9iv1j2v"
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-127c-61ff-fee2-b97e.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:127c:61ff:fee2:b97e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4bRMwS67grzySZ;
	Tue, 24 Jun 2025 14:21:44 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1750764105;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SiBWYF52ldVdAyjpa6Dr9mxN+UlONOOH/+/KD+gVQDg=;
	b=W9iv1j2vR8H4TzsDZSzdrBWqQuMV96tHnWfe2SEzvoAPNuOzXFdxYPl7+F9C7NV8rdqDvj
	/ozhdCrtjHTfkkoFEUtbgCOt8S/iBukdb8OEK64VUrMZ4hDnVcI1sfu0Tdp6JdoLRpUMcN
	hmT3JDPGYpwiOSNmvFXdXAps0w0XAGU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1750764105;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SiBWYF52ldVdAyjpa6Dr9mxN+UlONOOH/+/KD+gVQDg=;
	b=YdK6kN3oRfRPNbSE5aRZz6vhhMWmRyKxxg7m4gJjis/HJ09I/+6WFwO2Uol4ulnuW0bJHy
	ak5zauQYbZUBDZ0TlVOqW+rKjKH285aSs1VwnXsGuMpcKeRIT1T8GvF79E0BB1wK+6VFlW
	Mh9NjOTDqpsEwJPvvb2J4mZONc4mMdU=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1750764105; a=rsa-sha256; cv=none;
	b=gdkmV4sKf8wbg2B9bRe3kvQCFRW3VxZLIj5jRC6qaRFo3hhnWM2woTwIoOsQE9OECWvp5k
	l5Pp0/5WqJztWO+em0N/J2GPP8v43Debb5VhpZgt31wMhdGCJ18XjKw+kMCLD6MON6ak+D
	ByK4AWlFlAqSptW1dFJXDhExS+aa9Cc=
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 2E092634C93;
	Tue, 24 Jun 2025 14:21:44 +0300 (EEST)
Date: Tue, 24 Jun 2025 11:21:43 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Hanne-Lotta =?iso-8859-1?B?TeRlbnDk5A==?= <hannelotta@gmail.com>
Cc: mchehab@kernel.org, hljunggr@cisco.com, ribalda@chromium.org,
	hverkuil@xs4all.nl, skhan@linuxfoundation.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH v3 2/2] docs: Improve grammar, formatting in Video4Linux
Message-ID: <aFqKRyntONqsxJSs@valkosipuli.retiisi.eu>
References: <20250612172703.32293-1-hannelotta@gmail.com>
 <20250612172703.32293-2-hannelotta@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250612172703.32293-2-hannelotta@gmail.com>

Hei Hanne-Lotta,

On Thu, Jun 12, 2025 at 08:27:03PM +0300, Hanne-Lotta M‰enp‰‰ wrote:
> Fix typos, punctuation and improve grammar and formatting
> in documentation for Video4Linux (V4L).
> 
> Signed-off-by: Hanne-Lotta M‰enp‰‰ <hannelotta@gmail.com>

Thanks for the patch. Documentation patches should have "Documentation: "
prefix, similarly all media tree patches should have "media: " prefix. Also
the lines may be up to 75 characters long.

The result is:

-----8<----------
media: Documentation: Improve grammar, formatting in Video4Linux

Fix typos, punctuation and improve grammar and formatting in documentation
for Video4Linux (V4L).
-----8<----------

I changed this while applying the patch.

-- 
Terveisin,

Sakari Ailus
