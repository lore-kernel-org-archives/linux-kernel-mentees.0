Received: from out-171.mta1.migadu.com (out-171.mta1.migadu.com [95.215.58.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B0C3264FA
	for <linux-kernel-mentees@lists.linux.dev>; Thu,  9 Apr 2026 14:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775743849; cv=none; b=SgmmYy61Hh352/dZ8p377BJYnEHsbOdF5gsgvCF3uTAM8Dvnt7FiftsbCqZdvEYj4ji6vBgYN28biZtfHv0GHaTzPyv6XWO2i8HaRpnLOZZtkffnCYFDx6cvBWWboMR+GijJ0IPaDpZmLl9KFbyx1hUR9xsusdRlREVySKsyNLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775743849; c=relaxed/simple;
	bh=+S5V77JjvcFyHnQUaBrmreqFxuSoVNFTzdSuzZbQfyc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=hab4gXTMnnvdUpmVAdCjjQ0ssXHTegKhdQfCPDxoP+EkTJ4br62QMoKzidMn7pMxFrvhBu6RYD9Y0btQ/9sjILSANBkUzqCWKQiSUAMKwz546o4HZ8FoeALWRMya9cB8u+MSpzj3g/IvpXQV9EuM+Mi0jdO9h5Ww7Q39MgYRZI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=D6Ia4stE; arc=none smtp.client-ip=95.215.58.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="D6Ia4stE"
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1775743830;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+S5V77JjvcFyHnQUaBrmreqFxuSoVNFTzdSuzZbQfyc=;
	b=D6Ia4stEMIdnHqSuyaEXjMrO7TORj12ZNG7CrIfBD0rAH1wLgh2vU1xRnnlw9zhCCpvEcc
	8WAvwNGXW8RyouYKoAKlgtC4dcbMvzeBqCK1A2MxbOQ9+4rW5E4ppU9Y4zdpJUzBJKVbw3
	2DKZAlC4ElTbR+FmjENLC4jXpr+2PKk=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 09 Apr 2026 16:10:02 +0200
Message-Id: <DHOON505D3ZM.1AA36SQK4WOXO@linux.dev>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <linux-kernel-mentees@lists.linux.dev>, <skhan@linuxfoundation.org>,
 <david.hunter.linux@gmail.com>, <khalid@kernel.org>
Subject: Re: [PATCH v4 1/5] staging: rtl8723bs: move constant to right side
 of test in comparison
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Luka Gejak" <luka.gejak@linux.dev>
To: "Prithvi Tambewagh" <activprithvi@gmail.com>,
 <gregkh@linuxfoundation.org>, <abrahamadekunle50@gmail.com>,
 <b9788213@gmail.com>, <straube.linux@gmail.com>, <tmimiharoen@gmail.com>,
 <filippo.muschera@gmail.com>, <ethantidmore06@gmail.com>,
 <andriy.shevchenko@linux.intel.com>, <rayfraytech@gmail.com>,
 <david@cardinalsystem.net>, <weibu@redadmin.org>,
 <dharanitharan725@gmail.com>, <ignacio.pena87@gmail.com>,
 <dan.carpenter@linaro.org>, <karanja99erick@gmail.com>,
 <luka.gejak@linux.dev>, <khushalchitturi@gmail.com>, <suunj1331@gmail.com>,
 <s9430939@naver.com>, <nikolayof23@gmail.com>,
 <bryant.boatright@proton.me>, <ysinghcin@gmail.com>
References: <20260409135026.137904-1-activprithvi@gmail.com>
 <20260409135026.137904-2-activprithvi@gmail.com>
In-Reply-To: <20260409135026.137904-2-activprithvi@gmail.com>
X-Migadu-Flow: FLOW_OUT

On Thu Apr 9, 2026 at 3:50 PM CEST, Prithvi Tambewagh wrote:
> Move constant from the left side to the right side of the test in a
> comparison, where =3D=3D, !=3D, <=3D, >=3D, <, > operators are used, fixi=
ng the
> checkpatch warning: Comparisons should place the constant on the right
> side of the test.
>
> Signed-off-by: Prithvi Tambewagh <activprithvi@gmail.com>
> ---

...

LGTM.
Reviewed-by: Luka Gejak <luka.gejak@linux.dev>

Best regards,
Luka Gejak
