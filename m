Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com [95.215.58.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A3D26ED2B
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 24 Nov 2025 22:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764024961; cv=none; b=Dp2E2qXX9gGAlgtsdKSKFQD2pxorxxebg5L2W7IQB8DOOTmtCwD92qZDPrZN/TjHAvHb8Cdnv67B8EJ4kktNF7EMrpRQPv6IULtsobbs/aHkoJzrN2/82933+y4jBs0G31f6NhIEZmfsOd2F/gA6FjRIjiTuQvtAFt+3ciJye6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764024961; c=relaxed/simple;
	bh=zVFxAlT+Ye6pG3fN+Uqm5ODVlJ1WIMzNme4AW3//LkE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tw9hki0qHC7H2N3z4RfAj8cABOq6KoP4bfjl5qnp+GBVjT+xOJjgqStuYYE6t6yEca12h+njgmRffFlQ6SzejhbWORCPx5EVTtMe/1oEgOd98D9BHbYIUw4jfzbexSTdJlCEk+MLj1ZBE6OYs6wPnLvVpYxDicKx/WcMFUAi9HQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gvernon.com; spf=pass smtp.mailfrom=gvernon.com; dkim=pass (2048-bit key) header.d=gvernon.com header.i=@gvernon.com header.b=naxZORkh; arc=none smtp.client-ip=95.215.58.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gvernon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gvernon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gvernon.com header.i=@gvernon.com header.b="naxZORkh"
Date: Mon, 24 Nov 2025 22:56:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gvernon.com; s=key1;
	t=1764024956;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1sgRsWpN4EY/jQyw87FObeDN1VYIMzhvxtG0et18tEM=;
	b=naxZORkhjuDhAlSXNjyOPSZwNrxvalZBzanuIeDPj31P9XGXTdSEOQXb3A0zKZIKA9sQ6i
	QJnoqxnXvMTsKQtGFwLXRSej4dpjchoG/vOyBEpR0IBt7f+JkVU5KuOOiEVASbL39wRObu
	gBKWy0uCTD2Zoth0B1ud5YBhVFbcSqezZJgDWOWZT94t9dAesD3ymjQ+RjBqhCmjONNsLF
	vYT4hEPNFJTpFd7JGC8yexVXwQHxMta3iBlFky6jHHxYDsPGoaQ4+eJGr7oODBC+FBr1ks
	jFZFyUcToUZMzAGrlivMHXs4GqYlx8sfcSxsERV7/6s9wmJALc6c48DC4WiulQ==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: George Anthony Vernon <contact@gvernon.com>
To: Viacheslav Dubeyko <Slava.Dubeyko@ibm.com>
Cc: "frank.li@vivo.com" <frank.li@vivo.com>,
	"linux-kernel-mentees@lists.linux.dev" <linux-kernel-mentees@lists.linux.dev>,
	"slava@dubeyko.com" <slava@dubeyko.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"syzbot+97e301b4b82ae803d21b@syzkaller.appspotmail.com" <syzbot+97e301b4b82ae803d21b@syzkaller.appspotmail.com>,
	"glaubitz@physik.fu-berlin.de" <glaubitz@physik.fu-berlin.de>,
	"skhan@linuxfoundation.org" <skhan@linuxfoundation.org>,
	"penguin-kernel@i-love.sakura.ne.jp" <penguin-kernel@i-love.sakura.ne.jp>,
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] hfs: Update sanity check of the root record
Message-ID: <aSTiiwtxgmO9la-p@Bertha>
References: <d2b28f73-49c8-4e30-9913-01702da4dfe4@I-love.SAKURA.ne.jp>
 <20251104014738.131872-4-contact@gvernon.com>
 <ef0bd6a340e0e4332e809c322186e73d9e3fdec3.camel@ibm.com>
 <aRJvXWcwkUeal7DO@Bertha>
 <74eae0401c7a518d1593cce875a402c0a9ded360.camel@ibm.com>
 <aRKB8C2f1Auy0ccA@Bertha>
 <8cad54909f0597b4d9d204a97e8174ad1564ab97.camel@ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8cad54909f0597b4d9d204a97e8174ad1564ab97.camel@ibm.com>
X-Migadu-Flow: FLOW_OUT

On Tue, Nov 11, 2025 at 12:34:40AM +0000, Viacheslav Dubeyko wrote:
> On Tue, 2025-11-11 at 00:23 +0000, George Anthony Vernon wrote:
> > Maybe is_valid_cnid() should be is_valid_catalog_cnid(), since that is
> > what it is actually testing for at the interface with the VFS. Would you
> > agree?
> > 
> 
> CNID is abbreviation of Catalog Node ID. So, is_valid_catalog_cnid() will sound
> like Catalog Catalog Node ID. :)
> 
> Thanks,
> Slava.
> 
Indeed, I think my thinking got muddled up late at night :)

Thanks,

George
