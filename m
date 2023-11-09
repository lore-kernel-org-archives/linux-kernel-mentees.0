Received: from 13.mo584.mail-out.ovh.net (13.mo584.mail-out.ovh.net [178.33.251.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08121DA27
	for <linux-kernel-mentees@lists.linux.dev>; Thu,  9 Nov 2023 12:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=foxhound.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxhound.fi
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from director4.ghost.mail-out.ovh.net (unknown [10.108.16.32])
	by mo584.mail-out.ovh.net (Postfix) with ESMTP id 493F524DE9
	for <linux-kernel-mentees@lists.linux.dev>; Thu,  9 Nov 2023 11:54:09 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-mtzwj (unknown [10.110.115.240])
	by director4.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 85C921FE5E;
	Thu,  9 Nov 2023 11:54:08 +0000 (UTC)
Received: from RCM-web7.webmail.mail.ovh.net ([151.80.29.19])
	by ghost-submission-6684bf9d7b-mtzwj with ESMTPSA
	id RRNyHmDITGUefgQAf8sC0A
	(envelope-from <jose.pekkarinen@foxhound.fi>); Thu, 09 Nov 2023 11:54:08 +0000
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Thu, 09 Nov 2023 13:54:07 +0200
From: =?UTF-8?Q?Jos=C3=A9_Pekkarinen?= <jose.pekkarinen@foxhound.fi>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: evan.quan@amd.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, skhan@linuxfoundation.org, airlied@gmail.com,
 daniel@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] drm/amd/pm: replace 1-element arrays with flexible-array
 members
In-Reply-To: <2023110916-tinfoil-concur-77d8@gregkh>
References: <20231108065436.13969-1-jose.pekkarinen@foxhound.fi>
 <2023110835-magnolia-prune-02d0@gregkh>
 <1b20f2e4ddc0b0e94aa9a1f9c76ff75c@foxhound.fi>
 <2023110916-tinfoil-concur-77d8@gregkh>
User-Agent: Roundcube Webmail/1.4.15
Message-ID: <ee757d648a601ba3530e0eeb1c5d178e@foxhound.fi>
X-Sender: jose.pekkarinen@foxhound.fi
Organization: Foxhound Ltd.
X-Originating-IP: 109.70.100.69
X-Webmail-UserID: jose.pekkarinen@foxhound.fi
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 14438821884044027585
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedruddvuddgfedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggffhffvvefujghffgfkgihoihgtgfesthekjhdttderjeenucfhrhhomheplfhoshorucfrvghkkhgrrhhinhgvnhcuoehjohhsvgdrphgvkhhkrghrihhnvghnsehfohighhhouhhnugdrfhhiqeenucggtffrrghtthgvrhhnpeehieduleeufeeggfeuhefgueekjeegtdehudefvdduteefudevkeelfeduheejtdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeduvdejrddtrddtrddupddutdelrdejtddruddttddrieelpdduhedurdektddrvdelrdduleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehjohhsvgdrphgvkhhkrghrihhnvghnsehfohighhhouhhnugdrfhhiqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhdqmhgvnhhtvggvsheslhhishhtshdrlhhinhhugidruggvvhdpoffvtefjohhsthepmhhoheekgedpmhhouggvpehsmhhtphhouhht

On 2023-11-09 11:06, Greg KH wrote:
> On Thu, Nov 09, 2023 at 10:43:50AM +0200, José Pekkarinen wrote:
>> On 2023-11-08 09:29, Greg KH wrote:
>> > On Wed, Nov 08, 2023 at 08:54:35AM +0200, José Pekkarinen wrote:
>> > > The following case seems to be safe to be replaced with a flexible
>> > > array
>> > > to clean up the added coccinelle warning. This patch will just do it.
>> > >
>> > > drivers/gpu/drm/amd/pm/powerplay/smumgr/smu8_smumgr.h:76:38-63:
>> > > WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
>> > >
>> > > Signed-off-by: José Pekkarinen <jose.pekkarinen@foxhound.fi>
>> > > ---
>> > >  drivers/gpu/drm/amd/pm/powerplay/smumgr/smu8_smumgr.h | 2 +-
>> > >  1 file changed, 1 insertion(+), 1 deletion(-)
>> > >
>> > > diff --git a/drivers/gpu/drm/amd/pm/powerplay/smumgr/smu8_smumgr.h
>> > > b/drivers/gpu/drm/amd/pm/powerplay/smumgr/smu8_smumgr.h
>> > > index c7b61222d258..1ce4087005f0 100644
>> > > --- a/drivers/gpu/drm/amd/pm/powerplay/smumgr/smu8_smumgr.h
>> > > +++ b/drivers/gpu/drm/amd/pm/powerplay/smumgr/smu8_smumgr.h
>> > > @@ -73,7 +73,7 @@ struct smu8_register_index_data_pair {
>> > >
>> > >  struct smu8_ih_meta_data {
>> > >  	uint32_t command;
>> > > -	struct smu8_register_index_data_pair register_index_value_pair[1];
>> > > +	struct smu8_register_index_data_pair register_index_value_pair[];
>> >
>> > Did you just change this structure size without any need to change any
>> > code as well?  How was this tested?
>> 
>>     I didn't find any use of that struct member, if I missed
>> something here, please let me know and I'll happily address any
>> needed further work.
> 
> I don't think this is even a variable array.  It's just a one element
> one, which is fine, don't be confused by the coccinelle "warning" here,
> it's fired many false-positives and you need to verify this properly
> with the driver authors first before changing anything.

      My apologies to you, and anybody that feels the same, it is not my
intention to bother with mistaken patches, I just assume that this patch
or any other from me, will go to review process, where it should be fine
if the patch is right, wrong, need further work, or further testing 
either
from my side or anybody else, and at the end of the day I need to do
patches if I want to find my mentorship patches, and graduate.

> In short, you just changed the size of this structure, are you _sure_
> you can do that?  And yes, it doesn't look like this field is used, but
> the structure is, so be careful.

     I don't know, let check it out together and see where this goes.

     José.
