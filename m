Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1CE42FDC2C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 15 Sep 2025 10:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757932809; cv=none; b=hYL0gB4bAN9bZurixcRLkl4KLXWEZuDA7UAcD/fNLtTkcAUvHPrginPz5tqNVJ6nWSBaKus/B+VGWuGk9y15KajKrhEiG7ib5Zm+ibd6j3Z1PxSpEzzS/yXmfJxfbZsqaOOos2PILUulPVdDHTwu4uW6nyD+eAWupJsXwIHzr84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757932809; c=relaxed/simple;
	bh=7DD+FYFVxKo5eXxhjsD8Le/xHieotvm1eNjR0UnHFN0=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=LZgO4I6EOwo+bi1R0bP0aRnoh1qPhtvjcTepKi5V0e762sZ7fCafWkhIQBtAj4ktDohMiDPTVIbP0Q3OhM8ycaKNUilweb/ZoaiAOoeTfeGmCNlcHtyuIpyzFSU6Uw38Cjz4PWfrJ+IdtNiGXp4k/YEyANOfkiWpidU+Qsc8fc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gzVOZvgd; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gzVOZvgd"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5CC5840D8D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 15 Sep 2025 10:40:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -7.99
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pNCEqnWyco0B for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Sep 2025 10:40:04 +0000 (UTC)
X-Greylist: delayed 428 seconds by postgrey-1.37 at util1.osuosl.org; Mon, 15 Sep 2025 10:40:04 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1AD8B40CA4
Authentication-Results: smtp4.osuosl.org; dmarc=none (p=none dis=none) header.from=linux.intel.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1AD8B40CA4
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gzVOZvgd
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=192.198.163.18; helo=mgamail.intel.com; envelope-from=ilpo.jarvinen@linux.intel.com; receiver=<UNKNOWN> 
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 1AD8B40CA4
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 15 Sep 2025 10:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757932804; x=1789468804;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=7DD+FYFVxKo5eXxhjsD8Le/xHieotvm1eNjR0UnHFN0=;
  b=gzVOZvgd4F3X04PZFlzYZzcVohuzTqah0tz/lv5r8xH+sFKnJA4gPFIo
   jdbbbZVP9Y+dbBktn2wNhfJr/cjyS3m0OjR3v0eUay83US3qb0t4q5Gvk
   yT8jYKhSXm3piRQT66jeVir6AVyAoq5mmh4W9sesw9eBYL3dgSkAWfc2a
   A5Zx0vXoJaDH3fbs/ikh56rGvO2QxQSs1QXuioPJkcOL7p2D0+PWZICsG
   cb9bxuW9WPbreNS3YCdZDCjmRUBODdxUD4kx/sV129iHVNQOt0Lm5n34Y
   xHdLwgDO/dFY0jge69QB4a0LfoFWyWNZL8O7ZB364dVVnv7fkrcJfQn7o
   w==;
X-CSE-ConnectionGUID: fJavlAiHTMS4taIZAcHw5A==
X-CSE-MsgGUID: y9XQCFIBT2qwQ14gF9M7Mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11553"; a="59407767"
X-IronPort-AV: E=Sophos;i="6.18,265,1751266800"; 
   d="scan'208";a="59407767"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2025 03:32:55 -0700
X-CSE-ConnectionGUID: WmRyYp3YTXaEwsEvWGMbxg==
X-CSE-MsgGUID: taLFL3yMRiy3rCKHmDEYwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,265,1751266800"; 
   d="scan'208";a="175380810"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.39])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2025 03:32:51 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 15 Sep 2025 13:32:47 +0300 (EEST)
To: Mark Pearson <mpearson-lenovo@squebb.ca>
cc: rakuram <rakuram.e96@gmail.com>, linux-doc@vger.kernel.org, 
    "Derek J . Clark" <derekjohn.clark@gmail.com>, Armin Wolf <W_Armin@gmx.de>, 
    Jonathan Corbet <corbet@lwn.net>, 
    "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, 
    linux-kernel-mentees@lists.linuxfoundation.org, skhan@linuxfoundation.org
Subject: Re: [PATCH] Documentation/wmi: Fix Typo in lenovo-wmi-gamezone
In-Reply-To: <31b895a4-edd0-4ce5-a20a-7d0fb67e9721@app.fastmail.com>
Message-ID: <444b64a7-631e-4acf-d2c8-2f0acd379d61@linux.intel.com>
References: <20250817170644.5855-1-rakuram.e96@gmail.com> <31b895a4-edd0-4ce5-a20a-7d0fb67e9721@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 20 Aug 2025, Mark Pearson wrote:
> On Sun, Aug 17, 2025, at 1:06 PM, rakuram wrote:
> > Fixed the below typo error
> >
> > freqency ==> frequency
> > in Documentation/wmi/devices/lenovo-wmi-gamezone.rst
> >
> > Signed-off-by: rakuram <rakuram.e96@gmail.com>
> > ---
> >  Documentation/wmi/devices/lenovo-wmi-gamezone.rst | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/Documentation/wmi/devices/lenovo-wmi-gamezone.rst 
> > b/Documentation/wmi/devices/lenovo-wmi-gamezone.rst
> > index 997263e51a7d..22040250a97d 100644
> > --- a/Documentation/wmi/devices/lenovo-wmi-gamezone.rst
> > +++ b/Documentation/wmi/devices/lenovo-wmi-gamezone.rst
> > @@ -153,7 +153,7 @@ data using the `bmfdec 
> > <https://github.com/pali/bmfdec>`_ utility:
> >      [WmiDataId(1), read, Description("P-State ID.")] uint32 PStateID;
> >      [WmiDataId(2), read, Description("CLOCK ID.")] uint32 ClockID;
> >      [WmiDataId(3), read, Description("Default value.")] uint32 
> > defaultvalue;
> > -    [WmiDataId(4), read, Description("OC Offset freqency.")] uint32 
> > OCOffsetFreq;
> > +    [WmiDataId(4), read, Description("OC Offset frequency.")] uint32 
> > OCOffsetFreq;
> >      [WmiDataId(5), read, Description("OC Min offset value.")] uint32 
> > OCMinOffset;
> >      [WmiDataId(6), read, Description("OC Max offset value.")] uint32 
> > OCMaxOffset;
> >      [WmiDataId(7), read, Description("OC Offset Scale.")] uint32 
> > OCOffsetScale;
> > -- 
> > 2.43.0
> 
> Looks good to me.
> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>

Hi,

Isn't the typo in the original interface as well? I'm not very keen in 
accepting this kind of patches as this part is not really user 
documentation to begin with.

-- 
 i.

