From: rafael at kernel.org (Rafael J. Wysocki)
Date: Mon, 22 Jul 2019 10:29:55 +0200
Subject: [Linux-kernel-mentees] [PATCH 2/3] ACPI: Remove
	acpi_has_method() call from scan.c
In-Reply-To: <20190722023530.67676-3-skunberg.kelsey@gmail.com>
References: <20190722023530.67676-1-skunberg.kelsey@gmail.com>
	<20190722023530.67676-3-skunberg.kelsey@gmail.com>
Message-ID: <CAJZ5v0ix6fe2fj9_mbO5ZdQzkThe8PnkRbJWAuQHjB58x66ixg@mail.gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

On Mon, Jul 22, 2019 at 4:36 AM Kelsey Skunberg
<skunberg.kelsey at gmail.com> wrote:
>
> acpi_evaluate_reference() will return an error if the DEP method
> does not exist. Checking if the DEP method exists before the
> acpi_evaluate_reference() call is not needed. Remove acpi_has_method()
> call to avoid additional work.
>
> Signed-off-by: Kelsey Skunberg <skunberg.kelsey at gmail.com>
> ---
>  drivers/acpi/scan.c | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
> index 0e28270b0fd8..4f2b0b481cee 100644
> --- a/drivers/acpi/scan.c
> +++ b/drivers/acpi/scan.c
> @@ -1803,9 +1803,6 @@ static void acpi_device_dep_initialize(struct acpi_device *adev)
>
>         adev->dep_unmet = 0;
>
> -       if (!acpi_has_method(adev->handle, "_DEP"))
> -               return;
> -

As you can see, this just returns.

>         status = acpi_evaluate_reference(adev->handle, "_DEP", NULL,
>                                         &dep_devices);
>         if (ACPI_FAILURE(status)) {

Where this does something more on fallure.

Therefore the code after the change is not equivalent to the code
before it, so the changes is questionable.
