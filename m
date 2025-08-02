Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 572968836
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat,  2 Aug 2025 11:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754135451; cv=none; b=J5CCE/qcoPLRhAUhZxwefFcB8l3HOkFGQioETAsFmXrOAUBEsw9DtFt6x1V657RJrr7BkGkU1w3ZMJANZXYkYlsYFF5tjTX88Utdmov9R25Cf8sJAMv3ZBQ5y8GcHM7A+/ryqJg7gWBxTv/9/9OEEZfIDTw2OlbMO37bfQ+rVoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754135451; c=relaxed/simple;
	bh=4hcyyY0ycxXkMqvv8873RLDK7Dzwl+Bmd7CBnlGgJw4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gryLHeeMv9Dmg11Is9vL8WvvAFJps7G5H5ZeTg7EGFX09X538YVWQIUI4ZvJ88Up4/53GvLUBxtn4JblgL7XZZx/i+Zko+AnJ6E6qk7L7RTMzfpNxVSC+TUm8Va1nUsIDS9nOZoV6sHXavcAwFi6YOSLvUyds6oQjACUzQxDCr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sg0WJ4ia; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sg0WJ4ia"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0375F607B7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat,  2 Aug 2025 11:50:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sJzURlEE7sA7 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  2 Aug 2025 11:50:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=jic23@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 518A2607B2
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 518A2607B2
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sg0WJ4ia
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 518A2607B2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat,  2 Aug 2025 11:50:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 698AF600B0;
	Sat,  2 Aug 2025 11:50:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49D08C4CEEF;
	Sat,  2 Aug 2025 11:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754135446;
	bh=4hcyyY0ycxXkMqvv8873RLDK7Dzwl+Bmd7CBnlGgJw4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=sg0WJ4iaWt2fmucMbQ7OojnyCy1CbGoUATBLz6MdVpVqniPJ4jczxovgUhiA7+y01
	 FNjBRxNEt34uujktLT1+lJqiNdWQvXrb3zy+Vzb2HKbGYKFXcy0wN7KadR3SnU3MpV
	 NHcX+HhRyLlkvHF8J412g/c/vnIiZgRWIdGydRew+7AnbfQfTVINKQ4IRRoxDo7bi+
	 tpbZHX9BRikZiMJzk7wCXec8c4KEhLackYWcJ0SfGNvoqES+trEpICrymjdXsp90nq
	 25hc+FsTrew22pUMwiNHXBXOglL9B2CFvrhwx3LZNcQCbF35WFD0h8EMXMQvffV4Os
	 VluRLOBm+9Nhg==
Date: Sat, 2 Aug 2025 12:50:38 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Akshay Bansod <akbansd@gmail.com>, Lorenzo Bianconi
 <lorenzo@kernel.org>, David Lechner <dlechner@baylibre.com>, Nuno
 =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] iio: st_lsm6dsx: Replace scnprintf with sysfs_emit
Message-ID: <20250802125038.7a02cbce@jic23-huawei>
In-Reply-To: <aIIdU7mJi_cEdRuI@smile.fi.intel.com>
References: <20250723141359.11723-1-akbansd@gmail.com>
	<aID01DxC1Hf2PK0i@smile.fi.intel.com>
	<20250723164100.34e864d6@jic23-huawei>
	<aIIdU7mJi_cEdRuI@smile.fi.intel.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 24 Jul 2025 14:47:31 +0300
Andy Shevchenko <andriy.shevchenko@intel.com> wrote:

> On Wed, Jul 23, 2025 at 04:41:00PM +0100, Jonathan Cameron wrote:
> > On Wed, 23 Jul 2025 17:42:28 +0300
> > Andy Shevchenko <andriy.shevchenko@intel.com> wrote:  
> > > On Wed, Jul 23, 2025 at 07:43:59PM +0530, Akshay Bansod wrote:  
> 
> ...
> 
> > > >  	fs_table = &hw->settings->fs_table[sensor->id];
> > > >  	for (i = 0; i < fs_table->fs_len; i++)
> > > > -		len += scnprintf(buf + len, PAGE_SIZE - len, "0.%09u ",
> > > > -				 fs_table->fs_avl[i].gain);
> > > > -	buf[len - 1] = '\n';
> > > > +		len += sysfs_emit_at(buf, len, "0.%09u ",
> > > > +				     fs_table->fs_avl[i].gain);
> > > > +
> > > > +	sysfs_emit_at(buf, len - 1, "\n");    
> > > 
> > > Still looks a bit weird (while working).
> > >   
> > > >  	return len;    
> > > 
> > > I deally we should have a helper doing all this under the hood for plenty of
> > > the (existing) users in the kernel.  
> > 
> > hmm I'm not sure generic is terribly easy  
> 
> I agree, I have some plans for %p specifier extension, but I was stuck with it
> and it in half-basked state in some of my local Git branches.
> 
> > and I'd prefer this using the
> > read_avail callbacks that require the data in an array where ever possible.
> > Mind you that does the same print at len - 1 as this.  Let's play. 
> > Completely untested.
> > 
> > 	for (i = 0; i < fs_table->fs_len; i++)
> > 		len += sysfs_emit_at(buf, len, "0x%09u%c",
> > 				     fs_table->fs_avl[i].gain,
> > 				     ((i == fs_table->fs_len - 1) ? '\n', ' '));
> > 
> > better?  
> 
> Without extra parentheses this makes the job.
> 
Akshay, can you spin a new version along those lines?
> 
> > It's definitely not more readable than the above, but it does avoid the write
> > to len - 1.
> >   
> > > In any case, I leave this change to others to comment, I don't object pushing
> > > it in this form, either way len - 1 is simply weird.  
> 

