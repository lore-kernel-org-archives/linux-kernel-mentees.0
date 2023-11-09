Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9526010A19
	for <linux-kernel-mentees@lists.linux.dev>; Thu,  9 Nov 2023 09:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="fp3XYzZk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA174C433C7;
	Thu,  9 Nov 2023 09:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1699520801;
	bh=aREHLc+TYmAypcve6YQJsCcETJWSOyfcp56f4SIqchQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fp3XYzZkaZD54ayEILKaIbNnDFFW7dBkAuLI6XzNQ4vw7zZIN1v7lqnMcaaL0xJeL
	 4r9vJXXwNQ1/I7fAwy8IXuQ1EXAUxeGFcOqYkdd1h1z4E/v70vNUdSR6kwjT/f8FIU
	 KSPiqU78Bh19szmFZANlOMP1y3CHm/nHjxVsAVC0=
Date: Thu, 9 Nov 2023 10:06:38 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: =?iso-8859-1?Q?Jos=E9?= Pekkarinen <jose.pekkarinen@foxhound.fi>
Cc: evan.quan@amd.com, alexander.deucher@amd.com, christian.koenig@amd.com,
	Xinhui.Pan@amd.com, skhan@linuxfoundation.org, airlied@gmail.com,
	daniel@ffwll.ch, amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] drm/amd/pm: replace 1-element arrays with flexible-array
 members
Message-ID: <2023110916-tinfoil-concur-77d8@gregkh>
References: <20231108065436.13969-1-jose.pekkarinen@foxhound.fi>
 <2023110835-magnolia-prune-02d0@gregkh>
 <1b20f2e4ddc0b0e94aa9a1f9c76ff75c@foxhound.fi>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1b20f2e4ddc0b0e94aa9a1f9c76ff75c@foxhound.fi>

On Thu, Nov 09, 2023 at 10:43:50AM +0200, José Pekkarinen wrote:
> On 2023-11-08 09:29, Greg KH wrote:
> > On Wed, Nov 08, 2023 at 08:54:35AM +0200, José Pekkarinen wrote:
> > > The following case seems to be safe to be replaced with a flexible
> > > array
> > > to clean up the added coccinelle warning. This patch will just do it.
> > > 
> > > drivers/gpu/drm/amd/pm/powerplay/smumgr/smu8_smumgr.h:76:38-63:
> > > WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> > > 
> > > Signed-off-by: José Pekkarinen <jose.pekkarinen@foxhound.fi>
> > > ---
> > >  drivers/gpu/drm/amd/pm/powerplay/smumgr/smu8_smumgr.h | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/amd/pm/powerplay/smumgr/smu8_smumgr.h
> > > b/drivers/gpu/drm/amd/pm/powerplay/smumgr/smu8_smumgr.h
> > > index c7b61222d258..1ce4087005f0 100644
> > > --- a/drivers/gpu/drm/amd/pm/powerplay/smumgr/smu8_smumgr.h
> > > +++ b/drivers/gpu/drm/amd/pm/powerplay/smumgr/smu8_smumgr.h
> > > @@ -73,7 +73,7 @@ struct smu8_register_index_data_pair {
> > > 
> > >  struct smu8_ih_meta_data {
> > >  	uint32_t command;
> > > -	struct smu8_register_index_data_pair register_index_value_pair[1];
> > > +	struct smu8_register_index_data_pair register_index_value_pair[];
> > 
> > Did you just change this structure size without any need to change any
> > code as well?  How was this tested?
> 
>     I didn't find any use of that struct member, if I missed
> something here, please let me know and I'll happily address any
> needed further work.

I don't think this is even a variable array.  It's just a one element
one, which is fine, don't be confused by the coccinelle "warning" here,
it's fired many false-positives and you need to verify this properly
with the driver authors first before changing anything.

In short, you just changed the size of this structure, are you _sure_
you can do that?  And yes, it doesn't look like this field is used, but
the structure is, so be careful.

thanks,

greg k-h
